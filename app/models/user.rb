class User < ActiveRecord::Base

  has_secure_password

  validates :password, presence: true, length: {minimum: 5}
  validates :password_confirmation, presence: true, length: {minimum: 5}
  validates :email, presence: true,  uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true


  #  Create an class method authenticate_with_credentials
  def self.authenticate_with_credentials(email_address, password)

    # see if there is a user in the database with the given email
    user = User.find_by_email(email_address.strip.downcase)

    # If the user exists AND the password provided is correct then return and instance of that user, if not return nil

    if user && user.authenticate(password)
      return user
    else
      nil
    end
end 

end
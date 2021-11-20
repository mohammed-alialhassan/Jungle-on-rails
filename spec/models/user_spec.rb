require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should save when all required fields are filled" do 
      @user = User.new({password:'onepiece', password_confirmation: 'onepiece', email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.save 
      expect(@user).to be_present
    end 

    it "returns 'First name can't be blank' if we try to create a User with a nil value in the first name field"  do 
      @user = User.new({password:'onepiece', password_confirmation: 'onepiece', email: 'strawhat@gmail.com', first_name: nil, last_name: "Luffy" })

      @user.valid?

      expect(@user.errors.full_messages).to include("First name can't be blank")

    end 

    it "should display Last name can't be blank!" do 
      @user = User.new({password:'onepiece', password_confirmation: 'onepiece', email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: nil })

      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end 

    it "should display email can't be blank!" do 
      @user = User.new({password:'onepiece', password_confirmation: 'onepiece', email: nil, first_name: "Strawhat", last_name: "Luffy" })

      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 

    it "should display password can't be blank!" do 
      @user = User.new({password:nil, password_confirmation: 'onepiece', email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end 

    it "should display password can't be less than 5 characters!" do 
      @user = User.new({password: "hi", password_confirmation: "hi", email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end 

    it "should display password confirmation can't be less than 5 characters!" do 
      @user = User.new({password: "hi", password_confirmation: "hi", email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end 


    it "should display password confirmation can't be less than 5 characters!" do 
      @user = User.new({password: "hi", password_confirmation: "hi", email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end 


    it "should display password does not match the password confirmation" do 
      @user = User.new({password: "onepiece", password_confirmation: "hi", email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end 

  end 


  describe '.authenticate_with_credentials' do
    #create a user and then test if they can login
    it "returns an instance of the user model if an existing user tries to login with the correct email and password" do
      @user = User.new({password: 'onepiece', password_confirmation: 'onepiece', email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.save

      expect(User.authenticate_with_credentials('strawhat@gmail.com', 'onepiece' )).to eq(@user)
    end


    it "returns nil if an existing user tries to login with the correct email and incorrect password" do
      @user = User.new({password: 'onepiece', password_confirmation: 'onepiece', email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.save

      expect(User.authenticate_with_credentials('strawhat@gmail.com', 'hi' )).to be nil
    end

    it "returns nil if user attempts to login with an email that is not in the database " do
      @user = User.new({password: 'onepiece', password_confirmation: 'onepiece', email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.save

      expect(User.authenticate_with_credentials('atari@gmail.com', 'onepiece' )).to be nil
    end

    it "returns an instance of the user model if an existing user tries to login with the correct email(with inconsistences in the case of the characters) and password"do
      @user = User.new({password: 'onepiece', password_confirmation: 'onepiece', email: 'strawhat@gmail.com', first_name: "Strawhat", last_name: "Luffy" })

      @user.save

      expect(User.authenticate_with_credentials('strawhat@gmail.com','onepiece')).to eq(@user)
    end
end
end
require 'rails_helper'
require 'Product'
require 'Category'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it "should save when all required fields are filled" do 
      @category = Category.new(name: 'Golden Retriever')
      @product= Product.new({name:"Beautiful Dogs", category: @category, quantity:2, price: 5400 })

      @product.valid?
      expect(@product.errors.full_messages).to eq([])
    end 

    it "should display name can't be blank!" do 
      @category = Category.new(name: 'Golden Retriever')
      @product= Product.new({name:nil, category: @category, quantity: 2, price: 5400 })

      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end 

    it "should display quantity can't be blank!" do 
      @category = Category.new(name: 'Golden Retriever')
      @product= Product.new({name:"Beautiful Dogs", category: @category, quantity:nil, price: 5400 })

      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")    
    end 

    it "should display price can't be blank!" do 
      @category = Category.new(name: 'Golden Retriever')
      @product= Product.new({name:"Beautiful Dogs", category: @category, quantity: 2, price: nil })

      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end 

    it "should display price can't be blank!" do 
      @category = Category.new(name: 'Golden Retriever')
      @product= Product.new({name:"Beautiful Dogs", category: nil, quantity: 2, price: nil })

      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end 
  end
end

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true 
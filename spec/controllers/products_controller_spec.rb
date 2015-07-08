require 'rails_helper'

describe "ProductsController" do

	before do
		@user = User.new(email:"remongeorge@live.com", password:"password", password_confirmation:"password")
		@user.skip_confirmation!
		@user.save!
		@count = Product.count
		@product = @user.products.create(name:"Testttt", description:"test",condition:"New", quantity:"22", upc_code:"123456789", price:"15")
	end

	it "creates a new product in product model" do
		
		expect(Product.count).to eq(@count + 1)
	end


end

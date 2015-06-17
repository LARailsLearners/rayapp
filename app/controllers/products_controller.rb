class ProductsController < ApplicationController
before_action :authenticate_user!
respond_to :html, :js

  def index
  	@products = current_user.products
  	@count= 0
  end

  def show
  end

  def new
  	@product = Product.new
  end

  def copy
    @product_copy = Product.find(params[:id])
    @product = Product.new
    @product.name = @product_copy.name
    @product.description = @product_copy.description
    @product.price = @product_copy.price
    @product.quantity = @product_copy.quantity
    @product.upc_code = @product_copy.upc_code
    @product.condition = @product_copy.condition
    @product.image = @product_copy.image
  end

  def create
  	@product = current_user.products.build(product_params)

  	if @product.save
  		flash[:notice] = "Product created"
  		redirect_to products_path
  	else
  		flash[:error] = "Please check the errors and try again"
  		render :new
  	end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  		flash[:notice]= "Product Updated"
  		redirect_to products_path
  	else
  		flash[:error] = "There was an error please try again"
  		render :edit
  	end
  end

  def destroy
    @product = Product.find(params[:id])
    name = @product.name
    if @product.destroy
      flash[:notice]= "\"#{name}\" was deleted successfully"
      redirect_to products_path
    else
      flash[:error] = "There was an error please try again"
      redirect_to products_path
    end
  end

  private

  def product_params
  	params.require(:product).permit(:name, :description, :price, :user_id,:condition, :quantity, :upc_code, :image)
  end
end

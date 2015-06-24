class ProductsController < ApplicationController
# before_action :authenticate_user!
respond_to :html, :js

  def index
    if current_user
  	@products = current_user.products
    authorize @products
  	@count= 0
  else
    redirect_to root_url, alert: "You are not authorized to perform this action."
    end
  end

  def index_all
    @products_all = Product.all
    authorize @products_all
    @count= 0 
    if params[:search]
      @products_all = Product.search(params[:search]).order("created_at DESC")
    else
      @products_all = Product.order("created_at DESC")
    end
  end


  def show
  end

  def new
  	@product = Product.new
    authorize @product
  end

  def copy
    @product_copy = Product.find(params[:id])
    @product = Product.new
    authorize @product_copy
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
    authorize @product

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
    authorize @product
  end

  def update
  	@product = Product.find(params[:id])
    authorize @product
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
    authorize @product
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

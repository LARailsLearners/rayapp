class FeedbacksController < ApplicationController
  def index
  end

  def new
  	@feedback= Feedback.new
  	@product= Product.find(params[:product_id])
  	@user = @product.user
    authorize @feedback
  end

  def create
  	@product= Product.find(params[:product_id])
  	@user = @product.user
  	@feedback = @user.feedbacks.build(feedback_params)
    @feedback.buyer = current_user.id
    @feedback.product_id = @product.id
    authorize @feedback

  	if @feedback.save
  		flash[:notice] = "Feedback Saved"
  		redirect_to @product
  	else
  		flash[:error] = "Please check the errors and try again"
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def feedback_params
  	params.require(:feedback).permit(:body, :positive, :user_id,:buyer, :product_id)
  end
end

class ReviewsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.review.all

  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Product successfully added!"
      redirect_to product_path(@review.product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
   @review = Review.find(params[:id])
   @product = @review.product
    if @review.update(review_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to product_path(@product)
    else
      render 'reviews/edit'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Product successfully deleted!"
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end

end

class ProductsController < ApplicationController
  def index
    @products = Product.ordered_by_name
    @three_most = Product.three_most_recent
    @one_most = Product.most_reviews
    if params[:search_country] != nil
      @products = Product.search_country(params[:search_country])
    end
  end

  def show
    @product = Product.find(params[:id])

  end
  def new
    @product = Product.new
  end

  def create
     @product = Product.new(product_params)
     if @product.save
       flash[:notice] = "Product successfully added!"
       redirect_to  products_path
     else
       render :new
     end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted!"
    redirect_to products_path
  end

  private
  def product_params
     params.require(:product).permit(:name, :cost, :country_origin)
  end
end

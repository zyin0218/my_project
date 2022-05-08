class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.new(product_params)
    if @products.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @products = Product.find(params["id"])
  end

  def destroy
    @products = Product.find(params["id"])
    @products.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(
      :title, :price, :sku, :description
    )
  end
end

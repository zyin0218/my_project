class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to root_path, notice: "商品新增成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path, notice: "商品更新成功"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path, notice: "商品已刪除"
  end

  private

  def product_params
    params.require(:product).permit(
      :title, :price, :sku, :description
    )
  end

  def find_product
    @product = Product.find(params["id"])
  end
end

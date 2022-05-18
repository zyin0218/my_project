class ProductsController < ApplicationController
  before_action :find_product, only: [:show]
  before_action :find_user_product, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    if user_signed_in?
      @product = Product.new
    else
      redirect_to root_path, notice: "請先登入會員"
    end
  end

  def create
    @product = current_user.products.new(product_params)

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
      :title, :price, :sku, :description, :cover
    )
  end

  def find_product
    @product = Product.find(params["id"])
  end

  def find_user_product
    @product = current_user.products.find(params["id"])
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product

  def create
    @comment = @product.comments.new(comment_params)

    if @comment.save
      # redirect_to product_path(@product), notice: "留言成功"
    else
      render "products/show"
    end
  end

  def destroy
  end

  private
  def find_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end

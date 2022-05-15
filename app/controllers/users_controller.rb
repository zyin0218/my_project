class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_users_path, notice: "會員註冊成功"
    else
      render :sign_up
    end
  end

  def login
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end

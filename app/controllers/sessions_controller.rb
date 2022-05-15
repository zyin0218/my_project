class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if user
      session[:thankyou9527] = user.id
      redirect_to root_path, notice: "登入成功"
    else
      redirect_to login_users_path, notice: "登入失敗"
    end
  end

  def destroy
    session[:thankyou9527] = nil
    redirect_to login_users_path, notice: "已登出"
  end
end

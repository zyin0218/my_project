class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :user_signed_in?, :current_user

  private
  def record_not_found
    render file: Rails.root.join("public/404.html"),
           layout: false,
           status: 404
  end

  def user_signed_in?
    session[:thankyou9527].present?
  end

  def current_user
    # memorization
    @_user_ ||= User.find_by(id: session[:thankyou9527])
  end

  def authenticate_user!
    redirect_to login_users_path, notice: "請先登入會員" if not user_signed_in?
  end
end

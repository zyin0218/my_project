module UsersHelper
  def user_signed_in?
    session[:thankyouhi].present?
  end

  def current_user
    User.find_by(id: session[:thankyouhi])
  end
end

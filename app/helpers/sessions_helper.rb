module SessionsHelper
  def current_user
    @current_user ||= User.find_by_id(cookies.signed[:user_id])
  end
end

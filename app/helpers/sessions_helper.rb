module SessionsHelper
  def current_user
    if user_id = cookies[:user_id]
      @current_user ||= User.find_by(id: user_id)
    else
      redirect_to new_session_path
    end
    @current_user
  end
end

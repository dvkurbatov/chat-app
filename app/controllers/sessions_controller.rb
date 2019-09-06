class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_by(nickname: params[:nickname])
    cookies.signed[:user_id] = @user.id
    redirect_to channels_path
  end
end

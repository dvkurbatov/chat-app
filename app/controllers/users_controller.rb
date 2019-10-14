class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    @messages = Message.where(author: current_user, listener: @user).or(Message.where(listener: current_user, author: @user))
  end
  def index
    @users = User.all_except(current_user)
  end
end
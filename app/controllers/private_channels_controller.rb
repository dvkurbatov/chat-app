class PrivateChannelsController < ApplicationController
  def create
    @private_channel = PrivateChannel.find_by(user_1_id: params[:user_id], user_2_id: current_user.id) || PrivateChannel.find_by(user_2_id: params[:user_id], user_1_id: current_user.id)
    if @private_channel
      redirect_to @private_channel
    else
      @private_channel = PrivateChannel.new(user_1_id: current_user.id, user_2_id: params[:user_id])
      @private_channel.save
      redirect_to @private_channel
    end
  end

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @private_channel = PrivateChannel.find_by(id: params[:id])
    redirect_to channels_path unless @private_channel

    @messages = @private_channel&.messages&.includes(:user).order(created_at: :asc).last(10)
  end
end

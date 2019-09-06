class MessagesController < ApplicationController
  def create
    @channel = Channel.find_by(id: params[:channel_id])
    @message = Message.create(user: current_user, channel: @channel, text: params[:text])
  end
end

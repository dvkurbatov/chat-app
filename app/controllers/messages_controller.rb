class MessagesController < ApplicationController
  def create
    @message = Message.create(author: current_user, listener: listener, text: params[:text])
    #byebug
    if listener.class.eql?(Channel)
      MessagesChannel.broadcast_to(listener, nickname: current_user.nickname, text: @message.text, author: current_user.id)
    else
      MessagesChannel.broadcast_to(listener, nickname: current_user.nickname, text: @message.text, author: current_user.id)
    end
  end

  private

  def listener
    @listener ||= Channel.find_by(id: params[:channel_id]) || User.find_by(id: params[:user_id])
  end
end

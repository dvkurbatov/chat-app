class MessagesController < ApplicationController
  def create
    @message = Message.create(author: current_user, listener: listener, text: params[:text])
    if listener.class.eql?(Channel)
      ActionCable.server.broadcast "channel_#{listener.id}",
        nickname: current_user.nickname,
        text: @message.text
    else
      ActionCable.server.broadcast "user_#{current_user.id}",
        nickname: current_user.nickname,
        text: @message.text
    end
  end

  private

  def listener
    @listener ||= Channel.find_by(id: params[:channel_id]) || User.find_by(id: params[:user_id])
  end
end

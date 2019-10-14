class MessagesChannel < ApplicationCable::Channel
  def subscribed
    if params[:listener_type].eql?('user')
      stream_for current_user
    elsif params[:listener_type].eql?('channel')
      channel = Channel.find_by_id(params[:listener_id])
      stream_for channel
    end
    #stream_for current_user
    #logger.info("#{Time.current}: subscribed calling! channel: }")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def logger
    logger ||= Logger.new("#{Rails.root}/log/cable.log")
  end
end

class MessagesChannel < ApplicationCable::Channel
  def subscribed
    if params[:listener_id] && params[:listener_type]
      stream_from "#{params[:listener_type]}_#{params[:listener_id]}"
    else
      stream_from "channels"
    end

    logger.info("#{Time.current}: subscribed calling! channel: #{params[:channel_id]}")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def logger
    logger ||= Logger.new("#{Rails.root}/log/cable.log")
  end
end

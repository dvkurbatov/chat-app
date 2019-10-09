class MessagesChannel < ApplicationCable::Channel
  def subscribed
    if params[:channel_id]
      stream_from "channel_#{params[:channel_id]}"
    else
      reject
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

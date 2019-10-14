class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users"
    current_user.appear
  end

  def unsubscribed
    current_user.away
  end
end
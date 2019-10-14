class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_user.appear
    stream_from 'users'
  end

  def unsubscribed
    current_user.away
  end
end
class ChannelsController < ApplicationController
  def new
  end

  def create
    @channel = Channel.new(title: params[:title])
    if @channel.save
      redirect_to channels_path
    else
      render :new
    end
  end

  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find_by(id: params[:id])
    redirect_to channels_path unless @channel

    @messages = @channel&.messages&.includes(:user)
  end
end

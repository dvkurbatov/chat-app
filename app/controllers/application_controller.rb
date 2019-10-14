class ApplicationController < ActionController::Base
  include SessionsHelper

  def authenticate
    redirect_to new_sessions_path unless current_user
  end
end

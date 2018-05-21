class ApplicationController < ActionController::Base
  before_action :authenticate_user
  config.serve_static_assets = true

  helper_method :current_user

  private

  def authenticate_user
    redirect_to log_in_path  unless current_user
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]

  end
end

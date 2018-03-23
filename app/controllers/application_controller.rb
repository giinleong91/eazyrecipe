class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to  new_session_path, notice: "There are issue authorizing you!"
    end
  end

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  helper_method :logged_in?
end

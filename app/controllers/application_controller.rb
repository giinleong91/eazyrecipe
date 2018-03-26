class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :authorize

  

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to  new_session_path#, notice: "There are issue authorizing you!"
    end
  end


end

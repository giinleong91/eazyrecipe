class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "There are issue authorizing you!"
    end
  end
end

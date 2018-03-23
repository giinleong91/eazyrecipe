class SessionsController < ApplicationController
  skip_before_action :authorize, only:[:new, :create, :index]

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully login"
      redirect_to root_path
    else
      flash[:notice] = "Bad email or password!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully log out!"
    redirect_to root_path
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end

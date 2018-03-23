class SessionsController < ApplicationController
  skip_before_action :authorize, only:[:new, :create, :index]

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
      flash[:notice] = "Bad email or password!"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
    flash[:notice] = "Successfully log out!"
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end

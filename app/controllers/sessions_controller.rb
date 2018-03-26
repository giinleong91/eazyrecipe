class SessionsController < ApplicationController
  skip_before_action :authorize, only:[:new, :create, :index]

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
     log_in user
      params[:remember_me] == '1' ? remember(user) : forget(user)
      flash[:notice] = "Successfully login"
      redirect_to root_path
    else
      flash[:notice] = "Bad email or password!"
      redirect_to sign_in_path
    end
  end

  def destroy
    if logged_in?
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
    end
    flash[:notice] = "Successfully log out!"
    redirect_to root_path
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end

class UsersController < ApplicationController
  skip_before_action :authorize, only:[:new, :create, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your profile has been created!"
      redirect_to root_path
    else
      flash[:notice] = "We have issues registering your account!"
      render "new"
    end
  end

  def show
    @user = User.find(user_params)
  end

  def edit
    @user = User.find(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
  end
end

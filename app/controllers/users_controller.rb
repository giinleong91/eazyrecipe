class UsersController < ApplicationController
  skip_before_action :authorize, only:[:new, :create, :index]
  before_action :find_user, only:[:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your profile has been created!"
      redirect_to root_path
    else
      flash[:notice] = "We have issues registering your account!"
      render "new"
    end
  end

  def show
   @fridge = Fridge.where(user_id: current_user)
  end

  def edit
  end

  private
  def find_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # def build_association(user)
  #   user.fridge.build   
  # end

end

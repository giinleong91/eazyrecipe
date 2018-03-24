class FridgesController < ApplicationController
before_action :find_user, only:[:index, :new, :create, :show, :edit, :update, :destroy]
before_action :set_fridge, only:[:show, :edit, :update, :destroy]

def index
  @fridge = Fridge.all
end

def new
  @fridge = Fridge.new
end

def create
  @fridge = @user.fridges.new(fridge_params)
  @fridge.user_id = @user.id
  if @fridge.save
    redirect_to @user
  else
    render "new"
  end
end

# def show

# end

def edit
  
end

def update
  
end

def destroy
  if @fridge.delete
    flash[:notice] = "Item destroy!"
  redirect_to @user
  else
    flash[:notice] = "Error deleting item."
  end
end

private

  def set_fridge
     @fridge = Fridge.find(params[:id])
  end
  def find_user
    @user = User.find(session[:user_id])
  end

def fridge_params
  params.require(:fridge).permit(:title, :user_id, :name, :amount, :done)
end

end

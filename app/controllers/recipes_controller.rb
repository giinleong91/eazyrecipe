class RecipesController < ApplicationController
  before_action :find_recipe, only:[:show, :edit, :update, :destroy]
  # before_action :require_user, expect: [:index, :show]

  def index
    @recipe = Recipe.all.order("created_at DESC")
    @user = current_user
    @fridge = Fridge.where(user_id: current_user)
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.directions.build
  end

  def create
    user = User.find(session[:user_id])
    @recipe = user.recipes.build(recipe_params)
    build_association(@recipe)
    if @recipe.save!
      flash[:notice] = "Congratulation, your recipe has been saved!"
      redirect_to @recipe
    else  
      flash[:notice] = "There is some issues to save your recipe. Please try again"
      render "new"
    end
  end

  def show
    @ingredient = Ingredient.where(recipe_id: @recipe.id)
    @direction = Direction.where(recipe_id: @recipe.id)
    @fridge = Fridge.where(user_id: current_user)
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe has been updated"
      redirect_to @recipe
    else
      render "edit"
    end
  end

  def destroy
    @recipe.destroy
    flash[:notice] = "Successfully deleted!"
    redirect_to root_path
  end

  def search
    @result = Recipe.search(params[:search])
        respond_to do |format|
          format.json { render json: @recipe }
          format.html { render "recipes/search"}
          format.js 
    end 
  end


private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :user_id, :video, :image, ingredients_attributes: [:id, :name, :amount, :recipe_id, :user_id, :_destroy], directions_attributes: [:id, :step, :recipe_id, :user_id, :_destroy])
  end 

  def build_association(recipe)
    recipe.ingredients.build
    recipe.directions.build    
  end

  # def set_association(ingredient, direction)
  #   recipe.ingredient.each do |ingredient|
  #     ingredient.user = user
  #   end

  #   recipe.direction.each do |direction|
  #     direction.user = user
  #   end
  # end

end

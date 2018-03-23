class RecipeController < ApplicationController
  before_action :find_recipe, only:[:show, :edit, :update, :destroy]

  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @ingredient = Ingredient.new(recipe_params)
    @direction = Direction.new(recipe_params)
    set_association(@ingredient, @direction)
    build_association(@recipe)
    if @recipe.save!
      flash[:notice] = "Congratulation, youre recipe has been saved!"
      redirect_to @recipe
    else  
      flash[:notice] = "There is some issues to save your recipe. Please try again"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe has been updated"
    else
      render "edit"
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :desciption, :user_id, :video, 
      ingredients_attributes: [:name, :amount, :recipe_id, :user_id], 
      directions_attributes: [:steps, :recipe_id, :user_id])
  end 

  def set_association(ingredient, direction)
    recipe.ingredient.each do |ingredient|
      ingredient.user = user
    end

    recipe.direction.each do |direction|
      direction.user = user
    end
  end

  def build_association(recipe)
    recipe.ingredient.build
    recipe.direction.build    
  end

end

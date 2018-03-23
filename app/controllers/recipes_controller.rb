class RecipesController < ApplicationController
  before_action :find_recipe, only:[:show, :edit, :update, :destroy]

  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.directions.build
  end

  def create
    user = User.find(session[:user_id])
    @recipe = user.recipes.build(recipe_params)
    # @recipe.ingredients.build
    # @recipe.directions.build
    # set_association(@ingredient, @direction)
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
    @ingredient = Ingredient.find_by(recipe_id: @recipe.id)
    @direction = Direction.find_by(recipe_id: @recipe.id)
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

private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :user_id, :video, ingredients_attributes: [:id, :name, :amount, :recipe_id, :user_id, :_destroy], directions_attributes: [:id, :step, :recipe_id, :user_id, :_destroy])
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

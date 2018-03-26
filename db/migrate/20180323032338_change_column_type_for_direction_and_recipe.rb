class ChangeColumnTypeForDirectionAndRecipe < ActiveRecord::Migration[5.1]
  def change
    remove_column :directions, :recipe_id
    add_reference :directions, :recipe, index: true
    remove_column :directions, :user_id
    add_reference :directions, :user, index: true
    remove_column :ingredients, :recipe_id
    add_reference :ingredients, :recipe, index: true
    remove_column :ingredients, :user_id
    add_reference :ingredients, :user, index: true
  end
end

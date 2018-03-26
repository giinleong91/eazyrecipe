class CreateIngredient < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.string :name
      t.integer :amount
      t.timestamps
    end
  end
end

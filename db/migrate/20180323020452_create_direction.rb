class CreateDirection < ActiveRecord::Migration[5.1]
  def change
    create_table :directions do |t|
      t.text :step
      t.integer :recipe_id
      t.integer :user_id
    end
  end
end

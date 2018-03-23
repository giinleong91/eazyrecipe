class CreateRecipe < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :user_id, index:true
      t.string :description
      t.string :video
      t.timestamps
    end
  end
end

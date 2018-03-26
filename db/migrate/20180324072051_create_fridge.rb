class CreateFridge < ActiveRecord::Migration[5.1]
  def change
    create_table :fridges do |t|
      t.string :title
      t.references :user, index: true
      t.string :name
      t.string :amount
      t.boolean :done
      t.timestamps
    end
  end
end

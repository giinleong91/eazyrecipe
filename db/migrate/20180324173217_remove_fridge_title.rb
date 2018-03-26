class RemoveFridgeTitle < ActiveRecord::Migration[5.1]
  def change
    remove_column :fridges, :title
  end
end

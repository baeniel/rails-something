class AddIndexToItems < ActiveRecord::Migration[5.2]
  def change
   add_index :items, :price
  end
end

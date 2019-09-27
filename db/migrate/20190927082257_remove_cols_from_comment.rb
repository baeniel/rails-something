class RemoveColsFromComment < ActiveRecord::Migration[5.2]
  def change
    remove_columns :comments, :user_id
    remove_columns :comments, :item_id
  end
end

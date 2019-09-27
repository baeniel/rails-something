class AddColsToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commentable_id, :string
    add_column :comments, :commentable_type, :string
  end
end

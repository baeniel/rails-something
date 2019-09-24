class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :image
      t.text :video
      t.string :address1
      t.string :address2
      t.string :zipcode
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end

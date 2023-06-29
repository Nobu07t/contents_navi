class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.text :catch_copy, null: false
      t.string :postal_code
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :addresses
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

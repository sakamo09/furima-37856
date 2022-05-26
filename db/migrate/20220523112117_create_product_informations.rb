class CreateProductInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :product_informations do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :situation_id, null: false
      t.integer :load_id, null: false
      t.integer :area_id, null: false
      t.integer :period_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true 

      t.timestamps
    end
  end
end

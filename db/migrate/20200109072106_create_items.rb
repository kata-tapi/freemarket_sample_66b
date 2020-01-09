class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,    null: false
      t.string :explanation,    null: false, index: true
      t.integer :status,    null: false
      t.integer :delivery_type,    null: false
      t.integer :postage,    null: false
      t.integer :region,    null: false
      t.integer :shipping_date
      t.integer :price,    null: false
      t.string :brand
      t.references :saler_id,    null: false, foreign_key: { to_table: :users }
      t.references :buyer_id,    null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
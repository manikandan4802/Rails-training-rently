class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :property_type
      t.integer :bhk
      t.integer :size
      t.integer :price
      t.string :address
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end

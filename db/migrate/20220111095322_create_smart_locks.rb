class CreateSmartLocks < ActiveRecord::Migration[6.0]
  def change
    create_table :smart_locks do |t|
      t.references :company, null: true, foreign_key: true
      t.references :property, null: true, foreign_key: true

      t.timestamps
    end
  end
end

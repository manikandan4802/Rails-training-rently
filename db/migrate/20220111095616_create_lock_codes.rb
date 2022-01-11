class CreateLockCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :lock_codes do |t|
      t.integer :code
      t.boolean :invitation
      t.references :property, null: false, foreign_key: true
      t.references :smart_lock, null: false, foreign_key: true

      t.timestamps
    end
  end
end

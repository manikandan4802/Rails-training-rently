class AddSerialNumberToSmartLock < ActiveRecord::Migration[6.0]
  def change
    add_column :smart_locks, :serial_number, :integer
  end
end

class AddassignedToSmartlock < ActiveRecord::Migration[6.0]
  def change
    add_column :smart_locks, :assigned, :boolean, :default => false
  end
end

class CreateAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :agents do |t|
      t.string :agent_name
      t.string :role
      t.integer :phone_number
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end

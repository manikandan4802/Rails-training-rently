class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :recipient_email
      t.references :agent, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.references :lock_code, null: false, foreign_key: true

      t.timestamps
    end
  end
end

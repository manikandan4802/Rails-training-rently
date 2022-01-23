class AddRecipientNameToInvitation < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :recipient_name, :string
  end
end

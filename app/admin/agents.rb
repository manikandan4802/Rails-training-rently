ActiveAdmin.register Agent do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :agent_name, :role, :phone_number, :company_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:agent_name, :role, :phone_number, :company_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  
  # f.input :agent_id, collection: Agent.all.map{|x| [x.agent_name, x.id]}
  form do |f|
    f.inputs :agent_name, :role, :phone_number, :company_id, :email, :encrypted_password, collection: Property.all.map{|x| [x.id]}
    f.actions
    end
  
end

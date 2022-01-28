ActiveAdmin.register Invitation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :recipient_email, :agent_id, :property_id, :lock_code_id, :recipient_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:recipient_email, :agent_id, :property_id, :lock_code_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs collection: Invitation.all.map{|x| [x.id]}
    actions
    end
  
end

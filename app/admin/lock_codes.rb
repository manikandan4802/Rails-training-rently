ActiveAdmin.register LockCode do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :code, :invitation, :property_id, :smart_lock_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:code, :invitation, :property_id, :smart_lock_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

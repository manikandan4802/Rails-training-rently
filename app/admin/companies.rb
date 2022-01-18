ActiveAdmin.register Company do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :company_name, :admin_name, :phone_number
  #
  # or
  #
  permit_params do
    permitted = [:company_name, :admin_name, :phone_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  end
  def to_s
    self.company_name
 end

  
end

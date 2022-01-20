ActiveAdmin.register Property do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :property_type, :bhk, :size, :price, :address, :agent_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:property_type, :bhk, :size, :price, :address, :agent_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  form do |f|
    f.inputs collection: Property.all.map{|x| [x.id]}
    actions
  end
end

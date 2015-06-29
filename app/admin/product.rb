ActiveAdmin.register Product do
# we can use this if we have another role who have access to the admin page
# but I don't want him to view this resource

 # menu if: proc{ current_user.admin? }
  

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
    permitted = [:name, :description, :price, :user_id,:condition, :quantity, :upc_code, :image, :image_cache]
  #   permitted << :other if resource.something?
  #   permitted
  end


end

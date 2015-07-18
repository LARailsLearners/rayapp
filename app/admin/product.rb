ActiveAdmin.register Product do
  ##config.filters = false
  remove_filter :feedbacks
  scope :all, default: true
  scope :no_image
  


  index do
    column :id do |product|
      link_to product.id, admin_product_path(product)
    end
    column :name
    column :condition
    column :upc_code
    column :price, sortable: :price do |product|
      div class: "price" do
        number_to_currency product.price
      end
    end
    column :quantity
    column :created_at
    column :updated_at
    column :image do |product|
      image_tag(product.image.tiny.url)
    end
    actions name: "Actions"
  end

# we can use this if we have another role who have access to the admin page
# but I don't want him to view this resource

 # menu if: proc{ current_user.admin? }
  

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
    permitted = [:name, :description, :price, :user_id,:condition, :quantity, :upc_code, :image, :image_cache]
  #   permitted << :other if resource.something?
  #   permitted
  end


end

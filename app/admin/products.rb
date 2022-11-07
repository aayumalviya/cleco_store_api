ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :product_description, :price, :old_price, :exclusive_price, :image, :product_details, :category_id, :is_published, :sub_category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :product_description, :price, :old_price, :exclusive_price, :image, :product_details, :category_id, :is_published]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :title
    column :price
    column :image
    column :old_price
    column :exclusive_price
    actions
  end

  show do
    attributes_table do
      row :title
      row :price
      row :old_price
      # row :old_price
      # row :exclusive_price
      row :product_description
      row :product_details
      # row :image do |product|
      #   image_tag url_for(product.image), height: 200, width: 200
      # end
    end
  end


  form do |f|
    f.inputs do
      f.input :title
      f.input :price
      # f.input :old_price
      # f.input :exclusive_price
      # f.input :image, as: :file
      f.input :category_id, :as => :select, :collection => Category.all.collect {|r| [r.name, r.id] }, include_blank: false
      f.input :sub_category_id, :as => :select, :collection => SubCategory.all.collect {|r| [r.name, r.id] }, include_blank: false
      f.input :product_details
      f.input :product_description
      f.input :is_published
    end
    f.actions
  end
end

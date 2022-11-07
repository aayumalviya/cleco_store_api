ActiveAdmin.register SubCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :logo, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :logo, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column :logo
    column :category
    actions
  end


  show do
    attributes_table do
      row :name
      # row :logo do |category|
      #   image_tag url_for(category.logo), height: 200, width: 200
      # end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :category_id, :as => :select, :collection => Category.all.collect {|r| [r.name, r.id] }, include_blank: false
      # f.input :logo, as: :file
    end
    f.actions
  end
end

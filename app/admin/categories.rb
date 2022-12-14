ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :logo
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :logo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

    index do
      selectable_column
      id_column
      column :name
      column :logo
      column :sub_categories
      actions
    end

    show do
      attributes_table do
        row :name
        row :sub_categories
        row :logo do |category|
          image_tag url_for(category.logo), height: 200, width: 200 if category.logo.attached?
        end
      end
    end

    form do |f|
      f.inputs do
        f.input :name
        f.input :logo, as: :file
      end
      f.actions
    end
  
end

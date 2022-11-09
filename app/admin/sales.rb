ActiveAdmin.register Sale do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :valid_from, :valid_to, :is_active
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :valid_from, :valid_to, :is_active, :boolean]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :title
    column :valid_from
    column :valid_to
    column :is_active
    actions
  end

  show do
    attributes_table do
      row :title
      row :valid_from
      row :valid_to
      row :is_active
    end
  end


  form do |f|
    f.inputs do
      f.input :title
      f.input :valid_from
      f.input :valid_to
      f.input :is_active
    end
    f.actions
  end
end

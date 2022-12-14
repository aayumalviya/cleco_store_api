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

  scope :all, default: true
  scope("Active") { |scope| scope.where(is_active: true) }
  scope("Inactive") { |scope| scope.where(is_active: false) }

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
      f.input :valid_from, as: :datetime_picker
      f.input :valid_to, as: :datetime_picker
      f.input :is_active
    end
    f.actions
  end
end

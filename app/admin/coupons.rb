ActiveAdmin.register Coupon do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :code, :discount_amount, :expiration_date, :total_redeem
  #
  # or
  #
  # permit_params do
  #   permitted = [:code, :discount_amount, :expiration_date, :total_redeem]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :code
      f.input :discount_amount
      f.input :expiration_date, as: :datetime_picker
      f.input :total_redeem
    end
    f.actions
  end
  
end

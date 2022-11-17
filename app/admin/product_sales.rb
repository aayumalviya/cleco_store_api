ActiveAdmin.register ProductSale do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :product_id, :sale_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_id, :sale_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :product
    column :sale
    actions
  end

  controller do
    def create
      error_messages = []
      sale = Sale&.find(params[:product_sale][:sale_id])
      params[:product_sale][:product_id].reject { |c| c.empty? }.each do |product_id|
        ps = ProductSale.new(product_id: product_id.to_i, sale_id: sale.id)
        unless ps.save
          error_messages << "Product: #{ps.product.title}, Error: #{ps.errors.full_messages.to_sentence}"
        end
      end

      if error_messages.present?
        flash[:error] = error_messages.to_sentence
        redirect_to admin_product_sales_path
      else
        flash[:notice] = "Product added to sale successfully"
        redirect_to admin_product_sales_path
      end
    end

    private

    def product_sale
      params.require(:product_sale).permit(:product_id, :sale_id)
    end
  end

  form do |f|
    f.inputs do
      f.input :product, input_html: { class: "select2" }, :collection => Product.all.collect {|r| ["#{r.id} - #{r.title}"] }, include_blank: false, multiple: true
      f.input :sale, input_html: { class: "select2" }, :collection => Sale.active.collect {|r| [r.title, r.id] }, include_blank: false, multiple: false
    end
    f.actions
  end
end

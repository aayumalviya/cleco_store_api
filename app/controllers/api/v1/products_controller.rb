class Api::V1::ProductsController <  Api::BaseController

  def index
    @products = Product.all

    if params[:category_ids]
      @products = @products&.where(category_id: params[:category_ids].split(","))
    end

    if params[:sub_category_ids]
      @products = @products&.where(sub_category_id: params[:sub_category_ids].split(","))
    end

    if params[:sort_by]
      if params[:sort_by] == 'popularity'
        @products = @products&.joins("INNER JOIN order_products ON order_products.product_id = products.id").group("products.id").order("COUNT(order_products.id) DESC")
      elsif params[:sort_by] == 'newest_first'
        @products = @products&.where("created_at >= ?", Date.today-4.weeks)
      elsif params[:sort_by] == 'low_to_high'
        @products = @products&.order('price asc')
      elsif params[:sort_by] == 'high_to_low'
        @products = @products&.order('price desc')
      end
    else
      @products = @products&.order('created_at desc')
    end

    if params[:q]
      @products = @products&.where('lower(title) like ?', "%#{params[:q].downcase}%")
    end
    @products = @products&.paginate(:page => params[:page], :per_page => 10)
      render json: {
                Products: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer),
                message: 'Products list fetched successfully',
                status: 200,
                type: 'Success'
      }
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product.present?
      render json: {
                  Products: ActiveModelSerializers::SerializableResource.new(@product, serializer: ProductSerializer),
                  message: 'Product details  fetched successfully',
                  status: 200,
                  type: 'Success'
        }
    else
      render json: {
                  Products: nil,
                  message: "Product not found",
                  status: 422,
                  type: 'Unprocessable Entity'
      }
    end
  end

  def new_arrivals
    @products = Product.where("created_at >= ?", Date.today-4.weeks)
      render json: {
                Products: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer),
                message: 'Products list fetched successfully',
                status: 200,
                type: 'Success'
      }
  end

  def top_sellings
    @products = Product.joins("INNER JOIN order_products ON order_products.product_id = products.id").group("products.id").order("COUNT(order_products.id) DESC")
      render json: {
                Products: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer),
                message: 'Products list fetched successfully',
                status: 200,
                type: 'Success'
      }
  end
end


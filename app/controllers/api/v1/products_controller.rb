class Api::V1::ProductsController <  Api::BaseController

  def index
    if params[:category_ids]
      @products = Product&.where(category_id: params[:category_ids].split(","))
    elsif params[:sub_category_ids]
      @products = Product&.where(sub_category_id: params[:sub_category_ids].split(","))
    elsif params[:q]
      @products = Product&.where('lower(title) like ?', "%#{params[:q].downcase}%")
    else
      @products = Product.all
    end
    @products = @products&.paginate(page: params[:page], per_page: 10).order('created_at desc')
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
    @products = Product.where("created_at >= ?", Date.today-2.weeks)
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


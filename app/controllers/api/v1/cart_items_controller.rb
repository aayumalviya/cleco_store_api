class Api::V1::CartItemsController < Api::BaseController
  before_action :find_current_user
  def index
    @cart_items = current_user.cart_items
    render json: {
          cart_items: ActiveModelSerializers::SerializableResource.new(@cart_items, each_serializer: CartItemSerializer),
          message: 'Cart list fetched successfully',
          status: 200,
          type: 'Success'
        }
  end



  def create
    @cart_item = current_user.cart_items.new(cart_item_params)
    @cart_item.product_id =  params[:product_id]
    if @cart_item.save
      render json: {
                  cart_item: ActiveModelSerializers::SerializableResource.new(@cart_item, serializer: CartItemSerializer),
                  message: 'Cart created successfully',
                  status: 200,
                  type: 'Success'
                }
    else
      render json: {
                  cart_item: nil,
                  message: @cart_item.errors.full_messages.to_sentence,
                  status: 422,
                  type: 'Unprocessable Entity'
                }
    end
  end

  def destroy
    @cart_item = CartItem.find_by(id: params[:id])
    if @cart_item&.destroy
      render json: {
                  cart_item: ActiveModelSerializers::SerializableResource.new(@cart_item, serializer: CartItemSerializer),
                  message: 'Cart_item deleted successfully',
                  status: 200,
                  type: 'Success'
        }
    else
      render json: {
                  cart_item: nil,
                  message: "Cart_item not found",
                  status: 422,
                  type: 'Unprocessable Entity'
                }
    end
  end


  private
    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end
end

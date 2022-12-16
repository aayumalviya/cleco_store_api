class Api::V1::OrdersController <  Api::BaseController
  before_action :find_current_user

  def index
    @orders = current_user.orders
    render json: {
          orders: ActiveModelSerializers::SerializableResource.new(@orders, each_serializer: OrderSerializer),
          message: 'Order list fetched successfully',
          status: 200,
          type: 'Success'
        }
  end

  def create
    if current_user.cart_items.present?
      @order = current_user.orders.new(uuid: SecureRandom.uuid)
      if @order.save
        @total_price = 0
        current_user.cart_items.each do |cart_item|
          product = cart_item.product
          if product.quantity.to_i > 0 && product.quantity.to_i >= cart_item.quantity.to_i
            OrderProduct.create(product_id: cart_item.product_id , order_id: @order.id)
            product.quantity = product.quantity - cart_item.quantity
            product.save
            @total_price += product.price
          end
        end
        if params[:code]
          @coupon = Coupon.find_by(code: params[:code])
          if @coupon
            cr = CouponRedemption.new(coupon_id: @coupon.id, user_id: current_user.id)
            if cr.save
              discount_amount = @coupon.discount_amount
              @total_price -= discount_amount
              @coupon.total_redeem -= 1
              @coupon.save
            end
          end
        end
        @order.update(total_amount: @total_price)
        current_user.cart_items.destroy_all
        @order.notifications.create(title: "your order has been placed successfully", user_id: current_user.id)
        render json: {
                    order: ActiveModelSerializers::SerializableResource.new(@order, serializer: OrderSerializer),
                    message: 'Order created successfully',
                    status: 200,
                    type: 'Success'
                  }
      else
        render json: {
                    order: nil,
                    message: @order.errors.full_messages.to_sentence,
                    status: 422,
                    type: 'Unprocessable Entity'
                  }
      end
    else
      render json: {
                    order: nil,
                    message: "Cart is empty",
                    status: 422,
                    type: 'Unprocessable Entity'
                  }
    end
  end


  def show
    @order = Order.find_by(id: params[:id])
    if @order.present?
      render json: {
                  order: ActiveModelSerializers::SerializableResource.new(@order, serializer: OrderSerializer),
                  message: 'Order details  fetched successfully',
                  status: 200,
                  type: 'Success'
                }
    else
      render json: {
                  order: nil,
                  message: "Product not found",
                  status: 422,
                  type: 'Unprocessable Entity'
                }
    end
  end

end
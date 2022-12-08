class Api::V1::WishListsController < Api::BaseController
  before_action :find_current_user
  def index
    @wish_lists = current_user.wish_lists
    render json: {
          wish_lists: ActiveModelSerializers::SerializableResource.new(@wish_lists, each_serializer: WishListSerializer),
          message: 'Wish list fetched successfully',
          status: 200,
          type: 'Success'
        }
  end

  def create
    @wish_list = current_user.wish_lists.new(wish_list_params)
    if @wish_list.save
      render json: {
                  wish_list: ActiveModelSerializers::SerializableResource.new(@wish_list, serializer: WishListSerializer),
                  message: 'Added to your Wishlist successfully',
                  status: 200,
                  type: 'Success'
                }
    else
      render json: {
                  wish_list: nil,
                  message: @wish_list.errors.full_messages.to_sentence,
                  status: 422,
                  type: 'Unprocessable Entity'
                }
    end
  end

  def destroy
    @wish_list = WishList.find_by(id: params[:id])
    if @wish_list&.destroy
      render json: {
                  wish_list: ActiveModelSerializers::SerializableResource.new(@wish_list, serializer: WishListSerializer),
                  message: 'wish_list deleted successfully',
                  status: 200,
                  type: 'Success'
        }
    else
      render json: {
                  wish_list: nil,
                  message: "wish_list not found",
                  status: 422,
                  type: 'Unprocessable Entity'
                }
    end
  end

  private
    def wish_list_params
      params.require(:wish_list).permit(:product_id)
    end

end
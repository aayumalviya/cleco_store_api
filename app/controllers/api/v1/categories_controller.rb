class Api::V1::CategoriesController <  Api::BaseController

    # before_action do
    #     ActiveStorage::Current.host = request.base_url
    # end

  def index
    @categories = Category.all
    render json: {
          categories: ActiveModelSerializers::SerializableResource.new(@categories, each_serializer: CategorySerializer),
          message: 'Category list fetched successfully',
          status: 200,
          type: 'Success'
        }
  end

  private
    def category_params
      arams.require(:category).permit(:name, :logo)
    end
end

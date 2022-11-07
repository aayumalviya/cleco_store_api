class Api::V1::CategoriesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @categories = Category.all
        render json: {
            categories: ActiveModelSerializers::SerializableResource.new(@categories, each_serializer: CategorySerializer),
            message: 'Category list fetched successfully',
            status: 200,
            type: 'Success'
        }
    end

    # def get_user_type(user)
    #   type = @user.roles.pluck(:name).to_sentence
    #     user.as_json.merge({
    #       user_type: type.to_sentence,
    #     })
    # end

    private
    def category_params
        params.require(:category).permit(:name)
    end
end

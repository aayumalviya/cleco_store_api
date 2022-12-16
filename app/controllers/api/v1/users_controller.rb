class Api::V1::UsersController < Api::BaseController
  before_action :find_current_user

  def user_profile
    render json: {
          user: ActiveModelSerializers::SerializableResource.new(current_user, serializer: UserSerializer),
          message: 'User details fetched successfully',
          status: 200,
          type: 'Success'
        }
  end
end

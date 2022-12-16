class Api::V1::NotificationsController < Api::BaseController
  before_action :find_current_user
  def index
    @notifications = current_user&.notifications
    render json: {
          notifications: ActiveModelSerializers::SerializableResource.new(@notifications, each_serializer: NotificationSerializer),
          message: 'notification list fetched successfully',
          status: 200,
          type: 'Success'
        }
  end

  def update
    @notification = Notification.find_by(id: params[:id])
    if @notification.update(update_params)
      render json: {
                  notification: ActiveModelSerializers::SerializableResource.new(@notification, serializer: NotificationSerializer),
                  message: 'Notification updated successfully',
                  status: 200,
                  type: 'Success'
                }
    else
      render json: {
                  notification: nil,
                  message: @delivery_address.errors.full_messages.to_sentence,
                  status: 422,
                  type: 'Unprocessable Entity'
                }
    end
  end

  private
    def update_params
      params.require(:notification).permit(:user_checked)
    end

end

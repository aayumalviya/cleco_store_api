class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_checked, :notifiable_type, :notifiable_id, :user_id, :parent_data
  belongs_to :user, serializer: UserSerializer

  def parent_data
    object.notifiable
  end
end

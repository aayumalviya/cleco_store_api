  # frozen_string_literal: false

  class Api::V1::SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]
    before_action :sign_in_params, only: :create
    before_action :load_user, only: :create
    skip_before_action :verify_signed_out_user, only: :destroy
  
    def create
      if @user.valid_password?(sign_in_params[:password])
        login = @user.user_logins.find_by(device_id: sign_in_params[:device_id], ip_address: sign_in_params[:ip_address])
        if @user.user_logins.blank?
            @user.update(authentication_token: SecureRandom.base64(10))
        end

        if login.present?
           login.update(fcm_token: sign_in_params[:fcm_token])
        else
            @user.user_logins.create(device_id: sign_in_params[:device_id], ip_address: sign_in_params[:ip_address], fcm_token: sign_in_params[:fcm_token])
        end

        sign_in 'user', @user
        render json: {
          data: ActiveModelSerializers::SerializableResource.new(@user, serializer: UserSerializer),
          message: "#{@user.first_name} login succesfully",
          status: 200,
          type: 'Success'
        }
      else
        render json: { messages: 'Signed In Failed - Unauthorized', is_success: false, data: {} }, status: :unauthorized
      end
    end
  
    def destroy
      @user = User.find_by(email: params[:user][:email])
      if @user.present?
         login = @user.user_logins.find_by(device_id:  sign_in_params[:device_id], ip_address:  sign_in_params[:ip_address])
         login&.destroy
         logins = @user.user_logins.reload
         @user.update(authentication_token: nil) if logins.blank?
        log_out_success
      else
        log_out_failure
      end
    end
  
    private
  
      def log_out_success
        render json: { message: 'Logged out.', is_success: true, data: {} }, status: :ok
      end
  
      def log_out_failure
        render json: { message: 'Logged out failure.', is_success: false, data: {} }, status: :ok
      end
      
      def sign_in_params
        params.require(:user).permit :first_name, :last_name, :email, :password, :phone_number,:device_id, :ip_address, :authentication_token, :fcm_token
      end
  
      def load_user
        @user = User.find_for_database_authentication(email: sign_in_params[:email])
        if(@user)
          return @user
        else
          render json: { messages: 'Cannot get User', is_success: false, data: {} }, status: :unauthorized
        end
      end
  end
  
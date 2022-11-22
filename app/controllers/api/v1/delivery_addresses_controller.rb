class Api::V1::DeliveryAddressesController < Api::BaseController
  before_action :find_current_user
  def index
    @delivery_addresses = current_user.delivery_addresses
    render json: {
          delivery_addresses: ActiveModelSerializers::SerializableResource.new(@delivery_addresses, each_serializer: DeliveryAddressesSerializer),
          message: 'Address list fetched successfully',
          status: 200,
          type: 'Success'
        }
  end

  def create
    @delivery_address = current_user.delivery_addresses.new(delivery_address_params)
    if @delivery_address.save
      render json: {
                  delivery_address: ActiveModelSerializers::SerializableResource.new(@delivery_address, serializer: DeliveryAddressesSerializer),
                  message: 'Address created successfully',
                  status: 200,
                  type: 'Success'
                }
    else
      render json: {
                  delivery_address: nil,
                  message: @delivery_address.errors.full_messages.to_sentence,
                  status: 422,
                  type: 'Unprocessable Entity'
                }
    end
  end

  def update
    @delivery_address = DeliveryAddress.find_by(id: params[:id])
    if @delivery_address.update(delivery_address_params)
      render json: {
                  delivery_address: ActiveModelSerializers::SerializableResource.new(@delivery_address, serializer: DeliveryAddressesSerializer),
                  message: 'Address updated successfully',
                  status: 200,
                  type: 'Success'
                }
    else
      render json: {
                  delivery_address: nil,
                  message: @delivery_address.errors.full_messages.to_sentence,
                  status: 422,
                  type: 'Unprocessable Entity'
                }
    end

  end

  def destroy
    @delivery_address = DeliveryAddress.find_by(id: params[:id])
    if @delivery_address.destroy
      render json: {
                  delivery_address: ActiveModelSerializers::SerializableResource.new(@delivery_address, serializer: DeliveryAddressesSerializer),
                  message: 'Address deleted successfully',
                  status: 200,
                  type: 'Success'
                }
    else
      render json: {
                  delivery_address: nil,
                  message: "Address not found",
                  status: 422,
                  type: 'Unprocessable Entity'
                }
    end
  end

  private
    def delivery_address_params
      params.require(:delivery_address).permit(:name, :mobile_number, :pincode, :locality, :address, :city, :state, :landmark, :alternate_phone, :address_type)
    end
end

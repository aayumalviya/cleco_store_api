class Api::V1::ProductsController < ApplicationController

    def index
        @products = Product.all
        render json: {
            Products: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer),
            message: 'Products list fetched successfully',
            status: 200,
            type: 'Success'
        }
    end
end

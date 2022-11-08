class Api::V1::ProductsController < ApplicationController

    def index
        if params[:category_ids]
            @products = Product.where(category_id: params[:category_ids].split(","))
        elsif params[:sub_category_ids]
            @products = Product.where(sub_category_id: params[:sub_category_ids].split(","))
        else
            @products = Product.all
        end
        @products = @products.paginate(page: params[:page], per_page: 2).order('created_at desc')
        render json: {
                Products: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer),
                message: 'Products list fetched successfully',
                status: 200,
                type: 'Success'
            }
    end


    # def filter_products
    #     if params[:category_ids]
    #         category = Product.where(category_id: params[:category_ids].split(","))
    #         render json: {
    #         Products: ActiveModelSerializers::SerializableResource.new(category, each_serializer: ProductSerializer),
    #         message: 'Products list fetched successfully',
    #         status: 200,
    #         type: 'Success'
    #     }
    #     elsif params[:sub_category_ids]
    #         sub_category = Product.where(sub_category_id: params[:sub_category_ids].split(","))
    #         render json: {
    #             Products: ActiveModelSerializers::SerializableResource.new(sub_category, each_serializer: ProductSerializer),
    #             message: 'Products list fetched successfully',
    #             status: 200,
    #             type: 'Success'
    #         }
    #     else
    #     products = Product.all
    #     render json: {
    #             Products: ActiveModelSerializers::SerializableResource.new(products, each_serializer: ProductSerializer),
    #             message: 'Products list fetched successfully',
    #             status: 200,
    #             type: 'Success'
    #         }
    #     end
    # end
end

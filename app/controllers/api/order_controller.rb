class Api::OrderController < ApplicationController
    before_action :set_order, only: [:update, :destroy]

    def index
        render json: Order.all
    end

    def create
        @order = Order.new(order_params)

        if @order.save
            order_product_save(@order, params[:products])
            render json: @order 
        else
            render json: {status: "error", code: 500, message: "Não foi possível salvar o pedido."}
        end
    end

    private

    def order_product_save(order, products)
        products.each do |product|
            if OrderProduct.create(order: order, product: product)
                render json: {status: "success", code: 200, message: "Order Product salvo com sucesso."} 
            else
                render json: {status: "error", code: 500, message: "Não foi possível salvar Order Product."}
            end
        end
    end

    def set_order
        @order = Order.find(params[:id])
    end

    def order_params
        params.require(:order).permit(:user_id, :status)
    end
end

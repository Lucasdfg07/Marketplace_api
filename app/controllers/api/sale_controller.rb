class Api::SaleController < ApplicationController
    before_action :set_sale, only: [:update, :destroy]

    def index
        render json: Sale.all
    end

    def create
        @sale = Sale.new(sale_params)

        if @sale.save
            render json: @sale 
        else
            render json: {status: "error", code: 500, message: "Não foi possível salvar a promoção."}
        end
    end

    def update
        if @sale.update(sale_params)
            render json: @sale 
        else
            render json: {status: "error", code: 500, message: "Não foi possível editar a promoção."}
        end
    end

    def destroy
        if @sale.destroy
            render json: {status: "success", code: 200, message: "Promoção excluída."} 
        else
            render json: {status: "error", code: 500, message: "Não foi possível excluir a promoção."}
        end
    end

    private

    def set_sale
        @sale = Sale.find(params[:id])
    end

    def sale_params
        params.require(:sale).permit(:price)
    end
end

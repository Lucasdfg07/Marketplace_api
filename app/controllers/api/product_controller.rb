class Api::ProductController < ApplicationController
    before_action :set_product, only: [:update, :destroy]

    def index
        render json: User.all
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            render json: @product 
        else
            render json: {status: "error", code: 500, message: "Não foi possível salvar o produto."}
        end
    end

    def update
        if @product.update(product_params)
            render json: @product 
        else
            render json: {status: "error", code: 500, message: "Não foi possível editar o produto."}
        end
    end

    def destroy
        if @product.destroy
            render json: {status: "success", code: 200, message: "Produto excluído."} 
        else
            render json: {status: "error", code: 500, message: "Não foi possível excluir o produto."}
        end
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:name, :description, :price, :size, :category_id)
    end
end

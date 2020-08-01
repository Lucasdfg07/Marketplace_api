class Api::CategoryController < ApplicationController
    before_action :set_category, only: [:update, :destroy]

    def index
        render json: Category.all
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            render json: @category 
        else
            render json: {status: "error", code: 500, message: "Não foi possível salvar a categoria."}
        end
    end

    def update
        if @category.update(category_params)
            render json: @category 
        else
            render json: {status: "error", code: 500, message: "Não foi possível editar a categoria."}
        end
    end

    def destroy
        if @category.destroy
            render json: {status: "success", code: 200, message: "Categoria excluída."} 
        else
            render json: {status: "error", code: 500, message: "Não foi possível excluir a categoria."}
        end
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end

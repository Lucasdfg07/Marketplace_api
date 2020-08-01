class Api::AddressController < ApplicationController
    before_action :set_address, only: [:update, :destroy]

    def index
        render json: Address.all
    end

    def create
        @address = Address.new(address_params)

        if @address.save
            render json: @address 
        else
            render json: {status: "error", code: 500, message: "Não foi possível salvar o endereço."}
        end
    end

    def update
        if @address.update(address_params)
            render json: @address 
        else
            render json: {status: "error", code: 500, message: "Não foi possível editar o endereço."}
        end
    end

    def destroy
        if @address.destroy
            render json: {status: "success", code: 200, message: "Endereço excluído."} 
        else
            render json: {status: "error", code: 500, message: "Não foi possível excluir o endereço."}
        end
    end

    private

    def set_address
        @address = Address.find(params[:id])
    end

    def address_params
        params.require(:address).permit(:street, :number, :cep, :neighborhood, :city, :state)
    end
end

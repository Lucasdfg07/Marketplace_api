class ApplicationController < ActionController::API
    before_action :is_authenticate?, except: [:create]

    def is_authenticate?
        if request.headers["HTTP_AUTHTOKEN"].blank?
            render json: {status: "error", code: 401, message: "Efetue o login antes de prosseguir!"}
            return
        elsif !User.find_by(authentication_token: request.headers["HTTP_AUTHTOKEN"])
            render json: {status: "error", code: 401, message: "Usuário não encontrado!"}
        end
    end
end

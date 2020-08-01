# frozen_string_literal: true

class Api::Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create

    # sign up
  def create
    user = User.new user_params
    
    user.address = Address.find(params[:user][:address])

    if user.save!
      render json: {
        messages: "Sign Up Successfully",
        is_success: true,
        data: {user: user}
      }, status: :ok
    else
      render json: {
        messages: "Sign Up Failded",
        is_success: false,
        data: {}
      }, status: :unprocessable_entity
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :telephone, :role, :document, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].present?
    render json: {
        messages: "Missing Params",
        is_success: false,
        data: {}
      }, status: :bad_request
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end

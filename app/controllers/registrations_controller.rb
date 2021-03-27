class RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { errors: [] }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

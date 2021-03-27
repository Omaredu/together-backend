class UsersController < ApplicationController
  before_action :authenticate_doctor!, only: :edit
  before_action :authenticate!, only: :show

  def show
    @user = User.find_filtered(params[:user_id])

    if !@user.nil?
      render json: { user: @user }, status: :ok
    else
      render json: { user: nil }, status: :not_found
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])

    @user.avatar.attach(params[:avatar]) if params[:avatar]

    if @user&.update(user_params)
      render json: { errors: [] }, status: :ok
    else
      render json: { errors: @user&.errors&.full_messages || [] }, status: :bad_request
    end
  end

  private

  def user_params
    params.permit( :name, :status, :gender, :age)
  end
end

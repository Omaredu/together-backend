class DoctorsController < ApplicationController
  before_action :authenticate!, only: :create
  before_action :authenticate_doctor!, only: [:destroy, :verify]

  def create
    @doctor = Doctor.new
    @doctor.user = Current.user

    if @doctor.save
      render json: { doctor: @doctor, errors: [] }, status: :created
    else
      render json: { doctor: nil, errors: @doctor.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    Current.doctor.destroy
    render json: { message: "Doctor succesfully removed" }, status: :ok
  end

  def verify
    Current.doctor.verify! unless Current.doctor.verified

    render json: { message: "Doctor succesfully verified" }, status: :ok
  end
end

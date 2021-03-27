class ApplicationController < ActionController::API
  private

  def authenticate!
    token = request.headers['Authorization'].split(' ').last
    decoded_payload = JWT.decode(token, 'my$ecretK3y', true, { algorithm: 'HS256' })[0]

    user = User.find_by(id: decoded_payload['user_id'])

    Current.user = user || nil
    Current.doctor = user.doctor || nil

    unless Current.user
      render json: { errors: [ "Invalid user" ] }, status: :forbidden
    end

  rescue
    render json: { errors: [ "Invalid authorization token" ] }, status: :forbidden
  end

  def authenticate_doctor!
    authenticate!

    if Current.user && !Current.doctor
      render json: { errors: [ "Invalid doctor" ] }, status: :forbidden
    end
  end
end

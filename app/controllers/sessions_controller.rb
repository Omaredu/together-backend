class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: session_params[:email])&.authenticate(session_params[:password])

    if @user
      payload = { user_id: @user.id }
      # TODO: Change secret to another place
      token = JWT.encode payload, 'my$ecretK3y', 'HS256'
      # puts JWT.decode(token, nil, false)[0]['user_id'].class
      render json: { token: token, errors: [] }, status: :ok
    else
      render json: { token: nil, errors: [ "Invalid email or password" ] }, status: :unauthorized
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end

class AuthenticationController < ActionController::Base
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])

    if user&.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: { errors: ["Invalid Username/Password"] }, status: :unauthorized
    end
  end

  private

  def payload(user)
    {
      auth_token: JsonWebToken.encode(user_id: user.id),
      user: { id: user.id, email: user.email }
    }
  end
end

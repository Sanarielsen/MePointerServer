class Api::V1::BaseController < ActionController::API
  before_action :authenticate_user!

  private

  def authenticate_user!
    header = request.headers["Authorization"]
    token  = header&.split(" ")&.last

    @current_user = User.find_by(auth_token: token)

    render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
  end
end

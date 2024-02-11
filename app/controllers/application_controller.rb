class ApplicationController < ActionController::API
  class AuthorizationFailure < StandardError; end

  rescue_from AuthorizationFailure do
    head :unauthorized
  end

  attr_accessor :current_user

  def authorize!
    bearer = request.headers["Authorization"]
    raise AuthorizationFailure if bearer.nil?

    token = TokenGenerator.decode(bearer)
    user_id = JSON.parse(token)["user_id"]
    self.current_user = Student.find(user_id)
  rescue JSON::ParserError, ActiveRecord::RecordNotFound
    raise AuthorizationFailure
  end
end

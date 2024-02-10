class ApplicationController < ActionController::API
  before_action :validate_params!

  rescue_from ContractValidationError do
    render json: "Invalid input", status: :method_not_allowed
  end

  private

  def validate_params!
    controller = self.class.name.sub("Controller", "")
    action = action_name.classify
    "Contracts::#{controller}::#{action}".safe_constantize
                                         &.new(params)
                                         &.call
  end
end

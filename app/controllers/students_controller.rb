class StudentsController < ApplicationController
  class ContractValidationError < StandardError; end
  class AuthorizationFailure < StandardError; end

  before_action :authorize!, only: :destroy
  before_action :validate_params, only: :create

  rescue_from AuthorizationFailure do
    head :unauthorized
  end

  rescue_from ContractValidationError do
    head :method_not_allowed
  end

  def create
    @student = Student.new(permitted_params)

    if @student.save
      response.headers["X-AUTH-TOKEN"] = TokenGenerator.encode(@student.id)
      render "students/create", status: :created
    else
      head :method_not_allowed
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy
  rescue ActiveRecord::RecordNotFound
    head :bad_request
  end

  private

  def authorize!
    bearer = request.headers["bearerAuth"]
    raise AuthorizationFailure if bearer.nil?

    student_id = params[:id]
    raise AuthorizationFailure if student_id.nil?

    token = TokenGenerator.encode(student_id)

    raise AuthorizationFailure unless bearer == token
  end

  def validate_params
    result = CreateStudentContract.call(permitted_params.to_h)
    raise ContractValidationError if result.failure?
  end

  def permitted_params
    params.require(:student).permit(:first_name, :last_name, :surname, :klass_id, :school_id)
  end
end

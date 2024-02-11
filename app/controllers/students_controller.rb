class StudentsController < ApplicationController
  class ContractValidationError < StandardError; end

  before_action :validate_params, only: :create

  rescue_from ContractValidationError do
    head :method_not_allowed
  end

  def create
    @student = Student.new(permitted_params)

    if @student.save
      render "students/create", status: :created
    else
      head :method_not_allowed
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy

    # TODO: authorization
  rescue ActiveRecord::RecordNotFound
    head :bad_request
  rescue UnauthorizedError
    head :unauthorized
  end

  private

  def validate_params
    result = CreateStudentContract.call(permitted_params.to_h)
    raise ContractValidationError if result.failure?
  end

  def permitted_params
    params.permit(:first_name, :last_name, :surname, :klass_id, :school_id)
  end
end

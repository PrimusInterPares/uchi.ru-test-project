class StudentsController < ApplicationController
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

  def permitted_params
    params.permit(:first_name, :last_name, :surname, :klass_id, :school_id)
  end
end

class StudentsController < ApplicationController
  before_action :set_student, only: %i[destroy]

  def index
    @students = Student.where(school_id: params[:school_id], klass_id: params[:klass_id])

    render "students/index", status: :ok
  end

  def create
    @student = Student.new(permitted_params)

    if @student.save
      render "students/create", status: :created
    else
      render json: "Invalid input", status: :method_not_allowed
    end
  end

  def destroy
    @student.destroy
    # TODO: implement
  rescue UnauthorizedError
    render json: "Некорректная авторизация", status: :unauthorized
  end

  private

  def set_student
    @student = Student.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    render json: "Некорректный id студента", status: :bad_request
  end

  def permitted_params
    params.require(:student).permit(:first_name, :last_name, :surname, :klass_id, :school_id)
  end
end

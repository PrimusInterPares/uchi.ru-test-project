class StudentsController < ApplicationController
  before_action :set_student, only: %i[show update destroy]

  def index
    @students = Student.all

    render json: @students
  end

  def show
    render json: @student
  end

  def create
    @student = Student.new(permitted_params)

    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(permitted_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def permitted_params
    params.require(:student).permit(:first_name, :last_name, :surname, :klass_id, :school_id)
  end
end

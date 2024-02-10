class KlassesController < ApplicationController
  before_action :set_klass, only: %i[show update destroy]

  def index
    @klasses = Klass.all

    render json: @klasses
  end

  def show
    render json: @klass
  end

  def create
    @klass = Klass.new(permitted_params)

    if @klass.save
      render json: @klass, status: :created
    else
      render json: @klass.errors, status: :unprocessable_entity
    end
  end

  def update
    if @klass.update(permitted_params)
      render json: @klass
    else
      render json: @klass.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @klass.destroy
  end

  private

  def set_klass
    @klass = Klass.find(params[:id])
  end

  def permitted_params
    params.require(:klass).permit(:number, :letter, :school_id)
  end
end

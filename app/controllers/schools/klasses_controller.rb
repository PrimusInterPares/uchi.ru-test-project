module Schools
  class KlassesController < ApplicationController
    def index
      @klasses = Klass.where(school_id: params[:school_id])

      render "schools/klasses/index", status: :ok
    end
  end
end

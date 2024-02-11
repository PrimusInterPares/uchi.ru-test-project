module Schools
  module Klasses
    class StudentsController < ApplicationController
      def index
        @students = Student.where(school_id: params[:school_id], klass_id: params[:klass_id])

        render "schools/klasses/students/index", status: :ok
      end
    end
  end
end

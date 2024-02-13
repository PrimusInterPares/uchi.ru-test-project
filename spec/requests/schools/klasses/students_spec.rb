require "rails_helper"
require "swagger_helper"

describe "Schools::Klasses::Students API" do
  path "/schools/{school_id}/classes/{klass_id}/students" do

    get "Вывести список студентов класса" do
      tags "students", "classes"
      produces "application/json"
      parameter name: :school_id, in: :path, type: :string
      parameter name: :klass_id, in: :path, type: :string

      response "200", "Список студентов" do
        Schemas::Schools::Klasses::StudentsList.schema

        context "when data persists" do
          let(:school_id) { create(:school).id }
          let(:klass_id) { create(:klass, school_id:).id }

          before do
            create_list(:student, 10, klass_id:, school_id:)
          end

          run_test!
        end

        context "when no data persists" do
          let(:school_id) { create(:school).id }
          let(:klass_id) { create(:klass, school_id:).id }

          run_test!
        end
      end
    end
  end
end

require "rails_helper"
require "swagger_helper"

describe "Schools::klasses API" do
  path "/schools/{school_id}/classes" do

    get "Вывести список классов школы" do
      tags "classes"
      produces "application/json"
      parameter name: :school_id, in: :path, type: :string

      response "200", "Список классов" do
        Schemas::Schools::KlassesList.schema

        context "when data persists" do
          let(:school) { create(:school) }
          let(:school_id) { school.id }

          before do
            create(:klass, school:, letter: "A")
            create(:klass, school:, letter: "B")
            create(:klass, school:, letter: "C")
            create(:klass, school:, letter: "D")
          end

          run_test!
        end

        context "when no data persists" do
          let(:school) { create(:school) }
          let(:school_id) { school.id }

          run_test!
        end
      end
    end
  end
end

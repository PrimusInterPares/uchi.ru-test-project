require "rails_helper"
require "swagger_helper"

describe "Schools::Klasses API" do
  path "/schools/{school_id}/classes" do

    get "Class list" do
      tags "classes"
      description "Вывести список классов школы"
      produces "application/json"
      parameter name: :school_id, in: :path, type: :string

      response "200", "Список классов" do
        schema type: :object,
               required: %w[data],
               properties: {
                 data: {
                   type: :array,
                   items: {
                     id: { type: :integer },
                     number: { type: :integer },
                     letter: { type: :string },
                     students_count: { type: :integer }
                   }
                 },
                 required: %w[id number letter students_count]
               }

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

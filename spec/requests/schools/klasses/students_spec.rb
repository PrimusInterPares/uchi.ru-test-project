require "rails_helper"
require "swagger_helper"

describe "Schools::Klasses::Students API" do
  path "/schools/{school_id}/classes/{klass_id}/students" do

    get "" do
      tags "students", "classes"
      description "Вывести список студентов класса"
      produces "application/json"
      parameter name: :school_id, in: :path, type: :string
      parameter name: :klass_id, in: :path, type: :string

      response "200", "Список студентов" do
        schema type: :object,
               required: %w[data],
               properties: {
                 data: {
                   type: :array,
                   items: {
                     id: { type: :integer },
                     first_name: { type: :string },
                     last_name: { type: :string },
                     surname: { type: :string },
                     klass_id: { type: :integer },
                     school_id: { type: :integer }
                   }
                 },
                 required: %w[id first_name last_name surname klass_id school_id]
               }

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

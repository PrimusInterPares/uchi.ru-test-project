require "rails_helper"
require "swagger_helper"

describe "Students API" do
  path "/students" do

    post "Регистрация нового студента" do
      tags "students"
      consumes "application/json"
      produces "application/json"
      parameter name: :student, in: :body, schema: {
        type: :object,
        required: %w[first_name last_name surname klass_id school_id],
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          surname: { type: :string },
          klass_id: { type: :integer },
          school_id: { type: :integer }
        }
      }

      response "201", "Successful operation" do
        Schemas::Student.schema

        let(:school) { create(:school) }
        let(:klass) { create(:klass) }
        let(:student) do
          {
            first_name: "First name",
            last_name: "Last name",
            surname: "Surname",
            klass_id: klass.id,
            school_id: school.id
          }
        end

        run_test!
      end

      response "405", "Invalid input" do
        context "when required parameter is missing" do
          let(:student) do
            {
              first_name: "First name",
              last_name: "Last name",
              surname: "Surname",
              school_id: 1
            }
          end

          run_test!
        end

        context "when required parameter has type mismatch" do
          let(:student) do
            {
              first_name: "First name",
              last_name: 123,
              surname: "Surname",
              klass_id: 1,
              school_id: 1
            }
          end

          run_test!
        end
      end
    end
  end

  path "/students/{user_id}" do

    delete "Удалить студента" do
      tags "students"
      consumes "application/json"
      parameter name: :user_id, in: :path, type: :string
      security [bearerAuth: []]

      response "204", "Successful operation" do
        let(:user_id) { create(:student).id }
        let(:bearerAuth) { TokenGenerator.encode(user_id) }

        run_test!
      end

      response "400", "Некорректный id студента" do
        let(:user_id) { -1 }
        let(:bearerAuth) { TokenGenerator.encode(user_id) }

        run_test!
      end

      response "401", "Некорректная авторизация" do
        let(:user_id) { create(:student).id }
        let(:bearerAuth) { "123" }

        run_test!
      end
    end
  end
end

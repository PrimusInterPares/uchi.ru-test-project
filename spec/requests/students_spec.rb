require "rails_helper"
require "swagger_helper"

describe "Students API" do
  path "/students" do

    post "Creates a student" do
      tags "students"
      description "Регистрация нового студента"
      consumes "application/json"
      produces "application/json"
      parameter name: :student, in: :body, schema: {
        type: :object,
        required: %w[student],
        properties: {
          student: {
            type: :object,
            properties: {
              first_name: { type: :string },
              last_name: { type: :string },
              surname: { type: :string },
              klass_id: { type: :integer },
              school_id: { type: :integer }
            },
            required: %w[first_name last_name surname klass_id school_id]
          }
        }
      }

      response "201", "Successful operation" do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 first_name: { type: :string },
                 last_name: { type: :string },
                 surname: { type: :string },
                 class_id: { type: :integer },
                 school_id: { type: :integer }
               },
               required: %w[id first_name last_name surname class_id school_id]

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

    delete "Deletes a student" do
      description "Удалить студента"
      consumes "application/json"
      parameter name: :user_id, in: :path, type: :string
      parameter name: "bearerAuth", in: :header, type: :string

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

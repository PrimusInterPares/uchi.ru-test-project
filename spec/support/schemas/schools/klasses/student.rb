module Schemas
  module Schools
    module Klasses
      module Student
        def self.schema
          {
            type: :object,
            additionalProperties: false,
            properties: {
              id: { type: :integer, example: 0 },
              first_name: { type: :string, example: "First name" },
              last_name: { type: :string, example: "Last name" },
              surname: { type: :string, example: "Surname" },
              klass_id: { type: :integer, example: 1 },
              school_id: { type: :integer, example: 1 }
            },
            required: %w[id first_name last_name surname klass_id school_id]
          }
        end
      end
    end
  end
end

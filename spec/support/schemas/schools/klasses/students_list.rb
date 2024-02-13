module Schemas
  module Schools
    module Klasses
      module StudentsList
        def self.schema
          {
            type: :object,
            additionalProperties: false,
            properties: {
              data: { type: :array, items: Schemas::Schools::Klasses::Student.schema },
              required: %w[data]
            }
          }
        end
      end
    end
  end
end

module Schemas
  module Schools
    module KlassesList
      def self.schema
        {
          type: :object,
          additionalProperties: false,
          properties: {
            data: { type: :array, items: Schemas::Schools::Klass.schema },
            required: %w[data]
          }
        }
      end
    end
  end
end

module Schemas
  module Schools
    module Klass
      def self.schema
        {
          type: :object,
          additionalProperties: false,
          properties: {
            id: { type: :integer, example: 3 },
            number: { type: :integer, example: 7 },
            letter: { type: :string, example: "A" },
            students_count: { type: :integer, example: 5 }
          },
          required: %w[id number letter students_count]
        }
      end
    end
  end
end

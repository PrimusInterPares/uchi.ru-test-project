class Klass < ApplicationRecord
  belongs_to :school, inverse_of: :klasses

  has_many :students, inverse_of: :klass

  validates :number,
            presence: true,
            numericality: { only_integer: true }

  validates :letter,
            presence: true,
            uniqueness: { scope: :school_id }

  validates :students_count,
            presence: true,
            numericality: { only_integer: true }
end

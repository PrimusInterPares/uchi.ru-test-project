class Student < ApplicationRecord
  belongs_to :klass, inverse_of: :students, counter_cache: true
  belongs_to :school, inverse_of: :students

  validates :first_name, presence: true
end

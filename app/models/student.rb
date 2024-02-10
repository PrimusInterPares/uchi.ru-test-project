class Student < ApplicationRecord
  belongs_to :klass, inverse_of: :students
  belongs_to :school, inverse_of: :students

  validates :first_name, :last_name, :surname, presence: true
end

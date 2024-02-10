class School < ApplicationRecord
  has_many :klasses, inverse_of: :school, dependent: :destroy
  has_many :students, inverse_of: :school, dependent: :destroy

  validates :title, presence: true
end

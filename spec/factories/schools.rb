FactoryBot.define do
  factory :school do
    sequence(:title) { |n| "School_#{n}" }
  end
end

FactoryBot.define do
  factory :klass do
    sequence(:number) { |n| n }
    sequence(:letter) { "A" }
    students_count { rand(1..40) }
    school
  end
end

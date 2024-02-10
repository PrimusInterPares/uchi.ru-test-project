FactoryBot.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.middle_name }
    surname { Faker::Name.last_name }
    klass
    school
  end
end

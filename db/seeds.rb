FactoryBot::create_list(:school, 2)
klass = FactoryBot::create(:klass, number: 1, letter: "A", school: School.first)
FactoryBot::create_list(:student, 10, klass:, school: School.first)
klass = FactoryBot::create(:klass, number: 1, letter: "B", school: School.first)
FactoryBot::create_list(:student, 10, klass:, school: School.first)
klass = FactoryBot::create(:klass, number: 1, letter: "C", school: School.first)
FactoryBot::create_list(:student, 10, klass:, school: School.first)
klass = FactoryBot::create(:klass, number: 1, letter: "D", school: School.first)
FactoryBot::create_list(:student, 10, klass:, school: School.first)
klass = FactoryBot::create(:klass, number: 1, letter: "A", school: School.second)
FactoryBot::create_list(:student, 10, klass:, school: School.second)
klass = FactoryBot::create(:klass, number: 1, letter: "B", school: School.second)
FactoryBot::create_list(:student, 10, klass:, school: School.second)
klass = FactoryBot::create(:klass, number: 1, letter: "C", school: School.second)
FactoryBot::create_list(:student, 10, klass:, school: School.second)
klass = FactoryBot::create(:klass, number: 1, letter: "D", school: School.second)
FactoryBot::create_list(:student, 10, klass:, school: School.second)

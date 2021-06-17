FactoryBot.define do
  factory :employee do
    email { Faker::Internet.unique.email }
    password { 'secret123' }
    name { Faker::Name.name }
  end
end

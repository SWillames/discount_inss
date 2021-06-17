FactoryBot.define do
  factory :proponent do
    full_name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    birth_date { Faker::Date.between(from: '1960-01-01', to: '2021-01-01') }
    email { Faker::Internet.unique.email }
    personal_phone { FFaker::PhoneNumberBR.phone_number } 
    reference_phone { FFaker::PhoneNumberBR.phone_number }
    salary { rand(100..3000.0) }
    discount_inss { rand(100..3000.0) }
  end
end

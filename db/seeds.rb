require 'faker'
require 'ffaker'

20.times do
  proponent = Proponent.new(
    full_name: Faker::Name.name,
    cpf: Faker::IDNumber.brazilian_citizen_number,
    birth_date: Faker::Date.between(from: '1960-01-01', to: '2021-01-01'),
    email: Faker::Internet.unique.email,
    personal_phone: FFaker::PhoneNumberBR.phone_number,
    reference_phone: FFaker::PhoneNumberBR.phone_number,
    salary: rand(800..3000.0),
    contribution: rand(80..300.0),
  )
  address = proponent.build_address
  address.zip_code = (rand(01000000..99999999).to_s)
  address.public_place = Faker::Address.street_address
  address.complement = Faker::Address.secondary_address
  address.city = Faker::Address.city 
  address.district = "Center" 
  address.uf = Faker::Address.state_abbr 

  proponent.save!
end
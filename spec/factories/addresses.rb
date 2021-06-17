FactoryBot.define do
  factory :address do
    zip_code { (rand(01000000..99999999).to_s) }
    public_place { Faker::Address.street_address }
    complement { Faker::Address.secondary_address }
    city { Faker::Address.city }
    district { "Center" }
    uf { Faker::Address.state_abbr}
    association :proponent 
  end
end

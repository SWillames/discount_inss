FactoryBot.define do
  factory :address do
    zip_code { "MyString" }
    public_place { "MyString" }
    complement { "MyString" }
    district { "MyString" }
    citizen { nil }
    city { nil }
  end
end

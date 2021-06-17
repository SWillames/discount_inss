FactoryBot.define do
  factory :proponent do
    full_name { "MyString" }
    cpf { "MyString" }
    birth_date { "2021-06-17" }
    personal_phone { "MyString" }
    reference_phone { "MyString" }
    salary { 1.5 }
    discount_inss { 1.5 }
  end
end

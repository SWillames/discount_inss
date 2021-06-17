require 'rails_helper'

feature 'Employee register a proponent' do
  let(:employee) { create(:employee) }
  let(:employee) { create(:employee) }
  scenario 'successfully' do
    login_as(employee, scope: :employee)
    visit root_path
    expect(page).to have_link(t('links.new', model: Proponent.model_name.human))

    click_on t('links.new', model: Proponent.model_name.human)
    fill_in t('activerecord.attributes.proponent.full_name'), with: Faker::Name.name
    fill_in t('activerecord.attributes.proponent.cpf'), with: Faker::IDNumber.brazilian_citizen_number
    fill_in t('activerecord.attributes.proponent.email'), with: Faker::Internet.email
    fill_in t('activerecord.attributes.proponent.birth_date'), with: Faker::Date.between(from: '1960-01-01', to: '2021-01-01')
    fill_in t('activerecord.attributes.proponent.personal_phone'), with: FFaker::PhoneNumberBR.phone_number
    fill_in t('activerecord.attributes.proponent.reference_phone'), with: FFaker::PhoneNumberBR.phone_number
    fill_in t('activerecord.attributes.address.zip_code'), with: "64800002"
    fill_in t('activerecord.attributes.address.public_place'), with: "Av. Bucar Neto"
    fill_in t('activerecord.attributes.address.district'), with: "Centro"
    fill_in t('activerecord.attributes.address.city'), with: "Floriano"
    fill_in t('activerecord.attributes.address.uf'), with: "PI"

    click_on t('helpers.submit.create', model: Proponent.model_name.human)

    expect(current_path).to eq proponents_path(Proponent.last)
    expect(page).to have_content(Proponent.last)
  end


  end

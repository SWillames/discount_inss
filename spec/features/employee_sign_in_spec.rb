require 'rails_helper'

feature 'Employee' do
  let(:employee) { create(:employee) }
  scenario 'successfully' do
    visit root_path

    fill_in 'E-mail', with: employee.email
    fill_in 'Senha', with: employee.password
    click_on 'Log in'

    expect(page).to have_current_path(proponents_path)
  end
end
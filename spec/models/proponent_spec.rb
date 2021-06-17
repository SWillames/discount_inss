require 'rails_helper'

RSpec.describe Proponent, type: :model do
  context 'relationship' do
    it { is_expected.to have_one(:address) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:personal_phone)}
    it { is_expected.to validate_presence_of(:salary)}
    it { is_expected.to validate_presence_of(:discount_inss)}
  
    
      let(:proponent) { create(:proponent) }
      let(:proponent1) { build(:proponent, email: proponent.email, cpf: proponent.cpf) }
    

    it 'expected validate uniqueness of email' do
      expect validate_uniqueness_of(:email).ignoring_case_sensitivity
      expect(proponent1).not_to be_valid
      expect(proponent1.errors[:email]).to be_present
    end

    it 'expected validate uniqueness of cpf' do
      expect validate_uniqueness_of(:cpf)
      expect(proponent1).not_to be_valid
      expect(proponent1.errors[:cpf]).to be_present
    end

    it 'require valid email' do
      proponent_invalid = Proponent.create(email: 'a@a.a')
      expect(proponent_invalid.errors[:email].size).to be>=1
    end

    it 'accepts valid email' do
      expect(proponent.errors[:email].count).to eq 0
    end
  end

end

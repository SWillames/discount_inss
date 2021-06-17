require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'relationship' do
    it { is_expected.to belong_to(:proponent) }
   
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :zip_code }
    it { is_expected.to validate_presence_of :public_place }
    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :uf }
  end
end

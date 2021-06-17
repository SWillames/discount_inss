require 'rails_helper'

RSpec.describe Employee, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password)}

   
    let(:employee) { create(:employee) }
    let(:employee1) { build(:employee, email: employee.email) }
  

    it "expected validate uniqueness of email" do
      expect validate_uniqueness_of(:email).ignoring_case_sensitivity
      expect(employee1).not_to be_valid
      expect(employee1.errors[:email]).to be_present
    end
  end
end
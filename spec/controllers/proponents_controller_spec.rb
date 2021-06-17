require 'rails_helper'
RSpec.describe ProponentsController, type: :controller do
  let(:employee) { create(:employee) }

  let!(:proponent) { create(:proponent) }

  let(:valid_attributes) do 
    attributes_for(:proponent, address_attributes: attributes_for(:address)) 
  end

  let(:invalid_attributes) do
    {cpf: '', address: '', email: 'a..@example.org'}
  end

  describe "GET #index" do

    it "returns a success response" do
      sign_in employee
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      sign_in employee
      get :show, params: {id: proponent.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      sign_in employee
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      sign_in employee
      get :edit, params: {id: proponent.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "requires a logged-in employee" do
        post :create, params: { proponent: valid_attributes }
        expect(response).to redirect_to(new_employee_session_path)
      end
    end

    context "with invalid params" do
      it "rende new template" do
        sign_in employee
        expect {
          post :create, params: { proponent: invalid_attributes}
        }.not_to change(Proponent, :count)
        expect(response).to render_template('proponents/new')
      end
    end
  end
end
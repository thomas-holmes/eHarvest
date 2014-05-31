require 'spec_helper'

describe AgencyCodesController do
  context '#index' do
    let!(:agency_codes) { 3.times.map { FactoryGirl.create(:agency_code) } }
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it 'returns item codes' do
      get :index, format: :json
      expect(response.status).to eq 200
      expect(assigns(:agency_codes)).to match_array agency_codes
      expect(response.body).to eq agency_codes.to_json
    end
  end

  context '#show' do
    let!(:agency_code) { FactoryGirl.create(:agency_code) }
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it 'returns item code' do
      get :show, id: agency_code, format: :json

      expect(response.status).to eq 200
      expect(assigns(:agency_code)).to eq agency_code
      expect(response.body).to eq agency_code.to_json
    end

  end

  context '#edit' do

  end

  context '#new' do

  end

  context '#create' do

  end

  context 'update' do

  end

  context 'destroy' do

  end
end

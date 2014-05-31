require 'spec_helper'

describe LocationsController do
  context '#index' do
    let!(:locations) { 3.times.map { FactoryGirl.create(:location) } }
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it 'returns item codes' do
      get :index, format: :json
      expect(response.status).to eq 200
      expect(assigns(:locations)).to match_array locations
      expect(response.body).to eq locations.to_json
    end
  end

  context '#show' do
    let!(:location) { FactoryGirl.create(:location) }
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it 'returns item code' do
      get :show, id: location, format: :json

      expect(response.status).to eq 200
      expect(assigns(:location)).to eq location
      expect(response.body).to eq location.to_json
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

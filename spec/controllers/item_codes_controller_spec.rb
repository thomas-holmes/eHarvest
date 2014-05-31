require 'spec_helper'

describe ItemCodesController do
  context '#index' do
    let!(:item_codes) { 3.times.map { FactoryGirl.create(:item_code) } }
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it 'returns item codes' do
      get :index, format: :json
      expect(response.status).to eq 200
      expect(assigns(:item_codes)).to match_array item_codes
      expect(response.body).to eq item_codes.to_json
    end
  end

  context '#show' do
    let!(:item_code) { FactoryGirl.create(:item_code) }
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it 'returns item code' do
      get :show, id: item_code, format: :json

      expect(response.status).to eq 200
      expect(assigns(:item_code)).to eq item_code
      expect(response.body).to eq item_code.to_json
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

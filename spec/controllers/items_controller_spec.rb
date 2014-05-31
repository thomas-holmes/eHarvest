require 'spec_helper'

describe ItemsController do
  context '#index' do
    let!(:items) { 3.times.map { FactoryGirl.create(:item) } }
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it 'returns items' do
      get :index, format: :json
      expect(response.status).to eq 200
      expect(assigns(:items)).to match_array items
      expect(response.body).to eq items.to_json
    end
  end

  context '#show' do
    let!(:item) { FactoryGirl.create(:item) }
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it 'returns item' do
      get :show, id: item, format: :json

      expect(response.status).to eq 200
      expect(assigns(:item)).to eq item
      expect(response.body).to eq item.to_json
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

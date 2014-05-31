require 'spec_helper'

describe AgenciesController do
  let(:agency) { FactoryGirl.create(:agency) }
  let!(:user) { FactoryGirl.create(:user, agency: agency) }

  context 'agency#show' do
    before(:each) { sign_in user }

    it 'responds with user' do
      get :show, format: :json
      expect(response.status).to eq 200
      expect(assigns(:agency)).to eq agency
      expect(response.body).to eq agency.to_json
    end
  end
end

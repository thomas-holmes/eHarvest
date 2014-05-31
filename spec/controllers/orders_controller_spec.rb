require 'spec_helper'

describe OrdersController do
  context 'signed in user' do
    let(:user) { FactoryGirl.create(:user, agency: agency) }
    let(:agency) { FactoryGirl.create(:agency) }

    before(:each) do
      sign_in user
    end

    context '#index' do
      it 'returns orders' do
        FactoryGirl.create(:order, agency: FactoryGirl.create(:agency))
        orders = 3.times.map { FactoryGirl.create(:order, agency: agency) }

        get :index, format: :json

        expect(response.status).to eq 200
        expect(assigns(:orders)).to match_array orders
      end
    end

    context '#show' do
      it 'returns order' do
        order = FactoryGirl.create(:order, agency: agency)

        get :show, id: order, format: :json

        expect(response.status).to eq 200
        expect(assigns(:order)).to eq order
      end
    end

    context '#edit' do
      it 'returns order' do
        order = FactoryGirl.create(:order, agency: agency)

        get :show, id: order, format: :json

        expect(response.status).to eq 200
        expect(assigns(:order)).to eq order
      end
    end

    context '#new' do
      it 'provides new order model' do
        get :new, format: :json

        expect(assigns(:order)).to be_new_record
      end
    end

    context '#create' do
      it 'creates an order model' do
        expect {
          post :create, order: FactoryGirl.attributes_for(:order, agency: agency)
        }.to change { agency.reload.orders.count }.by(1)
      end
    end

    context '#update' do
      it 'can update an order' do
        order = FactoryGirl.create(:order, agency: agency)

        put :update, id: order.id, order: { recipient: 'jim' }

        order.reload
        expect(order.recipient).to eq 'jim'
      end
    end

    context '#destroy' do
      it 'can destroy an order' do
        order = FactoryGirl.create(:order, agency: agency)

        delete :destroy, id: order, format: :json

        expect { Order.find(order.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end

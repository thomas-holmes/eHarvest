require 'spec_helper'

describe OrderItemsController do
  context 'signed in user' do
    let(:agency) { FactoryGirl.create(:agency) }
    let(:user) { FactoryGirl.create(:user, agency: agency) }
    let(:order) { FactoryGirl.create(:order, agency: agency) }

    before(:each) do
      sign_in user
    end

    context '#index' do
      it 'returns order_items' do
        order_items = 3.times.map { FactoryGirl.create(:order_item, order: order) }

        get :index, order_id: order, format: :json

        expect(response.status).to eq 200
        expect(assigns(:order_items)).to match_array order_items
      end
    end

    context '#show' do
      it 'returns order_item' do
        order_item = FactoryGirl.create(:order_item, order: order)

        get :show, order_id: order, id: order_item, format: :json

        expect(response.status).to eq 200
        expect(assigns(:order_item)).to eq order_item
      end
    end

    context '#edit' do
      it 'returns order_item' do
        order_item = FactoryGirl.create(:order_item, order: order)

        get :show, order_id: order, id: order_item, format: :json

        expect(response.status).to eq 200
        expect(assigns(:order_item)).to eq order_item
      end
    end

    context '#new' do
      it 'provides new order_item model' do
        get :new, order_id: order, format: :json

        expect(assigns(:order_item)).to be_new_record
      end
    end

    context '#create' do
      it 'creates an order_item model' do
        expect {
          post :create, order_id: order, order_item: FactoryGirl.attributes_for(:order_item, order: order)
        }.to change { order.reload.order_items.count }.by(1)
      end
    end

    context '#update' do
      it 'can update an order_item' do
        order_item = FactoryGirl.create(:order_item, order: order)

        new_qty = order_item.quantity + 10
        put :update, order_id: order, id: order_item.id, order_item: { quantity: new_qty }

        order_item.reload
        expect(order_item.quantity).to eq(new_qty)
      end
    end

    context '#destroy' do
      it 'can destroy an order_item' do
        order_item = FactoryGirl.create(:order_item, order: order)

        delete :destroy, order_id: order, id: order_item, format: :json

        expect { OrderItem.find(order_item.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end

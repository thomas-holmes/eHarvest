require 'spec_helper'

describe OrderItem do
  it 'has a functional factory' do
    order_item = FactoryGirl.create(:order_item)
    expect(order_item).to_not be_nil
  end
end

require 'spec_helper'

describe Order do
  it 'has a functional factory' do
    order = FactoryGirl.create(:order)
    expect(order).to_not be_nil
  end
end

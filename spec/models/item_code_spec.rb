require 'spec_helper'

describe ItemCode do
  it 'has a functional factory' do
    item_code = FactoryGirl.create(:item_code)
    expect(item_code).to_not be_nil
  end
end

require 'spec_helper'

describe Item do
  it 'has a functional factory' do
    item = FactoryGirl.create(:item)
    expect(item).to_not be_nil
  end
end

require 'spec_helper'

describe Location do
  it 'has a functional factory' do
    location = FactoryGirl.create(:location)
    expect(location).to_not be_nil
  end
end

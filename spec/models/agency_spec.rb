require 'spec_helper'

describe Agency do
  it 'has a functional factory' do
    agency = FactoryGirl.create(:agency)
    expect(agency).to_not be_nil
  end
end

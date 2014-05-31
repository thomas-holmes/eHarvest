require 'spec_helper'

describe AgencyCode do
  it 'has a functional factory' do
    agency_code = FactoryGirl.create(:agency_code)
    expect(agency_code).to_not be_nil
  end
end

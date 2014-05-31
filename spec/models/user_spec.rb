require 'spec_helper'

describe User do
  it 'has a functional factory' do
    user = FactoryGirl.create(:user)
    expect(user).to_not be_nil
  end
end

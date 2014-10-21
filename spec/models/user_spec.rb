require 'spec_helper'

describe User do
  let(:user) { build(:user) }

  it "responds to email" do
    expect(user).to respond_to :email
  end

  it "responds to password" do
    expect(user).to respond_to :password
  end

  it "responds to password_confirmation" do
    expect(user).to respond_to :password_confirmation
  end

  it "has a valid factory" do
    expect(user).to be_valid
  end
end

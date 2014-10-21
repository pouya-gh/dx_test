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

  describe "password" do
    it "has a length greater than 4" do
      user = build(:user, password: '123', password_confirmation: '123')
      expect(user).to be_invalid
    end

    it "is less than 30 characters" do
      user = build(:user, password: "a" * 31, password_confirmation: "a" * 31)
      expect(user).to be_invalid
    end

    it "is equal to password_confirmation" do
      user = build(:user, password: 'test', password_confirmation: 'test2')
      expect(user).to be_invalid
    end

    it "is required" do
      user = build(:user, password: "")
      expect(user).to be_invalid
    end
  end

  describe "password_confirmation" do
    it "is required" do
      user = build(:user, password_confirmation: "")
      expect(user).to be_invalid
    end
  end

  describe "email" do
    it "follows simple email format" do
      invalid_email_addresses = ["test@com", "test.com", "test@.com"]
      invalid_email_addresses.each do |email|
        expect(build(:user, email: email)).to be_invalid
      end
    end
  end
end

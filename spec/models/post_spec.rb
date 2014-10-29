require 'spec_helper'

describe Post do
  let(:post) { build(:post) }

  it "has a valid factory" do
    expect(post).to be_valid
  end

  it "responds to digest" do
    expect(post).to respond_to :digest
  end

  it "responds to title" do
    expect(post).to respond_to :title
  end
end

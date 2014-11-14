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

  it "responds to tags" do
    expect(post).to respond_to :tags
  end

  it "responds to find_by_tag" do
    expect(Post).to respond_to :find_by_tag
  end

  it "responds to image" do
    expect(post).to respond_to :image
  end

  it "returns array of posts with find_by_tag" do
    post = create(:post)
    expect(Post.find_by_tag(post.tags.first)).to include post
  end

  it "has an empty array of tags by default" do
    expect(Post.new.tags).to eql []
  end

  it "belongs to a user" do
    expect(post).to belong_to :user
  end

  it "is invalid without a title" do
    expect(build(:post, title: nil)).to be_invalid
  end

  it "is invalid without a digest" do
    expect(build(:post, digest: nil)).to be_invalid
  end
end

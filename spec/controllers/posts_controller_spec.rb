require 'spec_helper'

describe PostsController do
  describe "GET #index" do
    before do
      get :index
    end

    it "assigns all posts to @posts" do
      assigns(:posts).should == Post.all
    end

    it "renders index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET #search" do
    before do
      @posts = []
      @posts << create(:post, tags: ['rails'])
      @posts << create(:post, title: 'Testing Ruby on Rails applications')
      get :search, q: 'rails'
    end

    it "renders search template" do
      expect(response).to render_template :search
    end

    it "find posts both by title and tag" do
      assigns(:posts).should == @posts
    end
  end
end

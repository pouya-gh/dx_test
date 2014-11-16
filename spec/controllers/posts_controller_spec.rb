require 'spec_helper'

describe PostsController do
  describe "GET #index" do
    before do
      20.times do
        create(:post)
      end
      get :index
    end

    it "assigns all posts to @posts" do
      expect(assigns(:posts).to_a).to eql Post.order('id DESC').limit(10).to_a
    end

    it "renders index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET #search" do
    before do
      create(:post, tags: ['rails'])
      create(:post, title: 'another rails app', tags: [:test])
      create(:post, title: 'Testing Ruby on Rails applications')
      get :search, q: 'rails'
    end

    it "renders search template" do
      expect(response).to render_template :search
    end

    it "find posts both by title and tag" do
      posts = Post.where("LOWER(title) LIKE LOWER('%#{request.query_parameters[:q]}%')") |
              Post.find_by_tag('rails')
      assigns(:posts).should == posts
    end
  end

  describe "GET #show" do
    before do
      @post = create(:post)
      get :show, id: @post.id
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end

    it "assigns the post with the id specified in the params to @post" do
      expect(assigns(:post)).to eql @post
    end
  end
end

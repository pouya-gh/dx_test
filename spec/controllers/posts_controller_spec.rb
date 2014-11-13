require 'spec_helper'

describe PostsController do
  describe "get #index" do
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
end

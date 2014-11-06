require 'spec_helper'

describe PostsController do
  describe "GET #new" do
    before do
      get :new
    end

    it "renders new template" do
      expect(response).to render_template(:new)
    end

    it "assings a new post" do
      expect(assigns(:post)).to be_a_new(Post)
    end
  end
end

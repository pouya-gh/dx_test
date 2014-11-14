require 'spec_helper'

describe TagsController do
  describe "GET #index" do
    before do
      create(:post, tags: ['test', 'test1', 'test2'])
      create(:post, tags: ['test'])
      get :index, tag: 'test'
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end

    it "assigns posts with the specified tag to @posts" do
      assigns(:posts).should == Post.find_by_tag(request.query_parameters[:tag])
    end
  end
end

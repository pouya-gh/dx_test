require 'spec_helper'

describe TagsController do
  describe "GET #index" do
    before do
      get :index, tag: 'test'
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end

    it "assigns posts with the specified tag to @posts" do
      expect(assigns(:posts)).to eql Post.find_by_tag(request.env['tag'])
    end
  end
end

require 'spec_helper'

describe PostsController do
  include SessionsHelper
  describe "GET #new" do
    context 'signed in' do
      before do
        user = create(:user)
        sign_in user
        get :new
      end

      it "renders new template" do
        expect(response).to render_template(:new)
      end

      it "assings a new post" do
        expect(assigns(:post)).to be_a_new(Post)
      end
    end

    context 'not signed in' do
      before do
        get :new
      end

      it "redirects the user to login path" do
        expect(response).to redirect_to login_path(redirect_url: request.original_url)
      end
    end
  end
end

require 'spec_helper'

describe Admin::UsersController do
  include SessionsHelper
  describe "GET #show" do
    context 'signed in' do
      before do
        # signup the user
        @user = create(:user, id: 2)

        # sign in the user
        sign_in @user

        get :show, id: 2
      end

      it "renders show template" do
        expect(response).to render_template(:show)
      end

      it "create an admin instance of the User class" do
        expect(assigns(:user)).to eq @user
      end

      it "can only view its own profile" do
        other_user = create(:user, id: 1, email: 'other_user@test.com')
        get :show, id: 1
        expect(response).to redirect_to @user
      end
    end

    context 'not signed in' do
      before do 
        create(:user)
        get :show, id: 1
      end

      it "redirects to root path" do
        expect(response).to redirect_to login_path(redirect_url: request.original_url)
      end
    end
  end
end
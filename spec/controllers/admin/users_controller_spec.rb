require 'spec_helper'

describe Admin::UsersController do
  include SessionsHelper
  describe "GET #show" do
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
  end
end
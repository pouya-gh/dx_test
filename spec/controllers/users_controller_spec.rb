require 'spec_helper'

describe UsersController do
  include SessionsHelper
  describe "GET #new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    context 'signed in' do
      before do
        @user = create(:user)
        sign_in @user
        get :show, id: @user.id
      end

      it "redirects the user to its profile page" do
        expect(response).to render_template(:show)
      end

      context 'get another user profile' do
        before do 
          @other_user = create(:user, email: 'test2@test.com')
          get :show, id: @other_user.id
        end
        
        it "redirects to current user profile page" do
          expect(response).to redirect_to @user
        end

        it "adds a proper flash message" do
          expect(flash[:warning]).to eql I18n.translate('authorization.errors.profile_page')
        end
      end
    end

    context 'not signed in' do
      before do
        @user = create(:user)
        get :show, id: @user.id
      end

      it "redirects the user to login path" do
        expect(response).to redirect_to login_path(redirect_url: request.original_url)
      end

      it "adds a proper flash message" do
        expect(flash[:warning]).to eql I18n.translate('authorization.errors.signin')
      end
    end
  end

  describe "POST #create" do
    context 'with valid information' do
      it "adds a user to the database" do
        expect {
          post :create, { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end
    end

    context 'with invalid information' do
      it "will not add the user to the database" do
        expect {
          post :create, { user: attributes_for(:user, email: 'test@test') }
        }.to_not change(User, :count)
      end
    end
  end
end

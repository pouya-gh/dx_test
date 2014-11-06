require 'spec_helper'

describe PostsController do
  include SessionsHelper
  describe "GET #new" do
    context 'signed in' do
      context 'is admin' do
        before do
          user = create(:admin)
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

      context 'not admin' do
        before do
          user = create(:user)
          sign_in user
          get :new
        end

        it "should be redirected to user profile" do
          expect(response).to redirect_to(current_user)
        end

        it "renders authorization flash message" do
          expect(flash[:warning]).to eql I18n.translate('authorization.errors.new_post')
        end
      end
    end

    context 'not signed in' do
      before do
        get :new
      end

      it "redirects the user to login path" do
        expect(response).to redirect_to login_path(redirect_url: request.original_url)
      end

      it "renders not signed in flash message" do
        expect(flash[:warning]).to eql I18n.translate('authorization.errors.signin')
      end
    end
  end
end

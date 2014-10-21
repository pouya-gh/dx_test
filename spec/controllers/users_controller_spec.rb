require 'spec_helper'

describe UsersController do
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

require 'spec_helper'

describe SessionsController do
  describe "#new" do
    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
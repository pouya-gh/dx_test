require 'spec_helper'

feature "user sign up" do
  include ApplicationHelper
  let(:user) { build(:user) }

  context 'with valid data' do
    before(:each) do
      sign_up(user)
    end

    scenario "will show up a success alarm" do
      expect(page).to have_content(I18n.translate('user.register.success'))
    end

    scenario "render user profile" do
      expect(page).to have_title(full_title(I18n.translate('user.profile')))
    end
  end

  context 'with invalid data' do
    before(:each) do
      sign_up(build(:user, email: 'test@test'))
    end

    scenario "will show up a failure alarm" do
      expect(page).to have_content(I18n.translate('user.register.fail'))
    end

    scenario "render sign up form" do
      expect(page).to have_title(full_title(I18n.translate('user.register.text')))
    end
  end

  def sign_up(user)
    visit new_user_path
    fill_in I18n.translate('user.email'), with: user.email
    fill_in I18n.translate('user.password'), with: user.password
    fill_in I18n.translate('user.password_confirmation'), with: user.password_confirmation
    click_button I18n.translate('user.register.text')
  end
end

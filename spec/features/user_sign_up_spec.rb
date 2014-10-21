require 'spec_helper'

feature "user sign up" do
  let(:user) { build(:user) }

  scenario "with valid email and password" do
    sign_up(user)
    expect(page).to have_content(I18n.translate('user.register.success'))
  end

  def sign_up(user)
    visit new_user_path
    fill_in I18n.translate('user.email'), with: user.email
    fill_in I18n.translate('user.password'), with: user.password
    fill_in I18n.translate('user.password_confirmation'), with: user.password_confirmation
    click_button I18n.translate('user.register.text')
  end
end

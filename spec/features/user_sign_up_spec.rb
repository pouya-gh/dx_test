require 'spec_helper'

feature "user sign up" do
  let(:user) { build(:user) }

  scenario "with valid email and password" do
    sign_up(user)
    expect(page).to have_content(t('user.register.success'))
  end

  def sign_up(user)
    visit sign_up_path
    fill_in t('user.email'), with: user.email
    fill_in t('user.password'), with: user.password
    fill_in t('user.password_confirmation'), with: user.password_confirmation
    click_button t('user.register.text')
  end
end

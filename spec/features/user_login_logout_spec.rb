require 'spec_helper'

feature "login logout" do
  include ApplicationHelper
  scenario "successful login" do
    given_i_am_already_a_member
    and_i_am_in_login_page
    when_i_fill_the_form_and_press_sign_in_button
    then_i_should_be_redirected_to_my_profile_page
  end

  def given_i_am_already_a_member
    @user = create(:user)
  end

  def and_i_am_in_login_page
    visit login_path
  end

  def when_i_fill_the_form_and_press_sign_in_button
    fill_in I18n.translate('user.email'), with: @user.email
    fill_in I18n.translate('user.password'), with: @user.password
    click_button I18n.translate('user.login.text')
  end

  def then_i_should_be_redirected_to_my_profile_page
    expect(page).to have_title(full_title(I18n.translate('user.profile')))
  end
end
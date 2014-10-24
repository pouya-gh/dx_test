require 'spec_helper'

feature "login logout" do
  include ApplicationHelper
  include SessionsHelper
  scenario "successful login" do
    given_i_am_already_a_member
    and_i_am_in_login_page
    when_i_fill_the_form_and_press_sign_in_button
    then_i_should_be_redirected_to_my_profile_page
  end

  scenario "successful logout" do
    given_i_am_already_singend_in
    when_i_clicked_on_sign_out_link
    then_i_should_be_redirected_to_home_page
    and_see_login_link_in_the_navbar
  end

  # successful logout steps
  def given_i_am_already_singend_in
    @user = create(:user)
    visit login_path
    fill_login_form_data
  end

  def when_i_clicked_on_sign_out_link
    click_link I18n.translate('user.logout.text')
  end

  def then_i_should_be_redirected_to_home_page
    expect(page).to have_title(full_title(I18n.translate('static_pages.home.title')))
  end

  def and_see_login_link_in_the_navbar
    expect(page).to have_link(I18n.translate('user.login.text'))
  end

  # successful login steps
  def given_i_am_already_a_member
    @user = create(:user)
  end

  def and_i_am_in_login_page
    visit login_path
  end

  def when_i_fill_the_form_and_press_sign_in_button
    fill_login_form_data
  end

  def then_i_should_be_redirected_to_my_profile_page
    expect(page).to have_title(full_title(I18n.translate('user.profile')))
  end

  def fill_login_form_data
    fill_in I18n.translate('user.email'), with: @user.email
    fill_in I18n.translate('user.password'), with: @user.password
    click_button I18n.translate('user.login.text')
  end
end
require 'spec_helper'
require_relative 'steps/login_steps_macro'
require_relative 'steps/logout_steps_macro'
include ApplicationHelper
include LoginStepsMacro
include LogoutStepsMacro

feature "login logout" do
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
end
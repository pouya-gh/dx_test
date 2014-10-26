require 'spec_helper'
require_relative 'macros/authentication_feature_macro'
require_relative 'steps/signup_steps_macro.rb'
include ApplicationHelper
include AuthenticationFeatureMacro
include SignupStepsMacro

feature "user sign up" do
  scenario "signing up to the website" do
    as_a_guest_user
    given_i_am_in_sign_up_page
    when_i_submit_the_form_with_valid_data
    then_i_should_be_in_my_profile_page
    and_see_a_success_alarm
  end
end

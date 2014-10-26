require 'spec_helper'
require_relative 'macros/authentication_feature_macro'
require_relative 'steps/authorization_profile_view_steps'

feature "Authorization" do
  include AuthenticationFeatureMacro
  include AuthorizationProfileViewSteps

  scenario "signed in users redirect to their own profile when try to see other users profile page" do
    given_i_am_already_a_member
    and_i_am_signed_in
    when_i_go_to_other_users_profile_page
    then_i_should_be_redirected_to_my_own_profile
    and_see_the_corresponding_alert
  end
end
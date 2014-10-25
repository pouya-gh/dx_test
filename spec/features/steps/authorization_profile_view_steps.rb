module AuthorizationProfileViewSteps
  def given_i_am_already_a_member
    @user = create(:user)
    @other_user = create(:user, email: 'test2@test.com')
  end

  def and_i_am_signed_in
    sign_in @user
  end

  def when_i_go_to_other_users_profile_page
    visit user_path(@other_user)
  end

  def then_i_should_be_redirected_to_my_own_profile
    expect(find('h1')).to have_content(@user.email)
  end

  def and_see_the_corresponding_alert
    expect(page).to have_content(I18n.translate('authorization.errors.profile_page'))
  end
end
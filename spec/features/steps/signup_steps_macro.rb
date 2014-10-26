module SignupStepsMacro
  def as_a_guest_user
    @user = build(:user)
  end

  def given_i_am_in_sign_up_page
    visit new_user_path
  end

  def when_i_submit_the_form_with_valid_data
    sign_up @user
  end

  def then_i_should_be_in_my_profile_page
    expect(page).to have_title(full_title(I18n.translate('user.profile')))
  end

  def and_see_a_success_alarm
    expect(page).to have_content(I18n.translate('user.register.success'))
  end
end

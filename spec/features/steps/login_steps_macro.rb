module LoginStepsMacro
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
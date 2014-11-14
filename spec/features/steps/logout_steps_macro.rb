module LogoutStepsMacro
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
    expect(page).to have_title(full_title(I18n.translate('post.index')))
  end

  def and_see_login_link_in_the_navbar
    expect(page).to have_link(I18n.translate('user.login.text'))
  end
end
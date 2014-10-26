module AuthenticationFeatureMacro
  def sign_in(user)
    visit login_path
    fill_in I18n.translate('user.email'), with: user.email
    fill_in I18n.translate('user.password'), with: user.password
    click_button I18n.translate('user.login.text')
  end

  def sign_up(user)
    fill_in I18n.translate('user.email'), with: user.email
    fill_in I18n.translate('user.password'), with: user.password
    fill_in I18n.translate('user.password_confirmation'), with: user.password_confirmation
    click_button I18n.translate('user.register.text')
  end
end
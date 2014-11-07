module ManagingPostsStepsMacro
  # writing posts
  def when_i_go_to_new_post_path
    visit new_post_path
  end

  def and_fill_the_form_with_a_valid_post
    fill_post_form(build(:post))
    click_button I18n.translate('post.create.text')
  end

  def and_see_post_created_message
    expect(page).to have_content(I18n.translate('post.create.success'))
  end

  # editing posts
  def when_i_go_to_edit_post_path
    @post = create(:post)
    visit edit_post_path(@post)
  end

  def and_change_post_properties_in_the_edit_form
    fill_post_form(build(:post))
    click_button I18n.translate('post.edit.text')
  end

  def and_see_post_edited_message
    expect(page).to have_content(I18n.translate('post.edit.success'))
  end

  # shared
  def given_i_am_a_admin_user
    @user = create(:admin)
  end

  def and_i_am_signed_in
    sign_in @user
  end

  def then_i_shoud_be_in_my_dashboard
    expect(page).to have_title(full_title(I18n.translate('user.admin.dashboard')))
  end

  private

  def fill_post_form(post)
    fill_in I18n.translate('post.title'), with: post.title
    fill_in I18n.translate('post.digest'), with: post.digest
  end
end
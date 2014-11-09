module ManagingPostsStepsMacro
  # writing posts
  def when_i_go_to_new_post_path
    visit new_admin_post_path
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
    visit edit_admin_post_path(@post)
  end

  def and_change_post_properties_in_the_edit_form
    fill_post_form(build(:post))
    click_button I18n.translate('post.edit.text')
  end

  def and_see_post_edited_message
    expect(page).to have_content(I18n.translate('post.edit.success'))
  end

  # deleting posts
  def and_have_some_posts
    @post = @user.posts.new attributes_for(:post)
    @post.save!
  end

  def and_i_am_in_my_dashboard_page
    visit admin_user_path(@user)
  end

  def when_i_click_on_a_post_delete_link
    click_link I18n.translate('post.delete.text')
  end

  def and_see_no_more_that_post
    expect(page).to_not have_content(@post.title)
  end

  def and_a_proper_deleted_message
    expect(page).to have_content(I18n.translate('post.delete.success'))
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
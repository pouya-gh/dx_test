class PostsController < ApplicationController
  before_filter :check_signed_in

  def new
    @post = Post.new 
    begin
      authorize @post
    rescue Pundit::NotAuthorizedError
      flash[:warning] = t('authorization.errors.new_post')
      redirect_to current_user
    end
  end

  private

  def check_signed_in
    unless signed_in?
      flash[:warning] = t('authorization.errors.signin')
      redirect_to login_path(redirect_url: request.original_url)
    end
  end
end  

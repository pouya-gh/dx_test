class PostsController < ApplicationController
  private

  def check_signed_in
    unless signed_in?
      flash[:warning] = t('authorization.errors.signin')
      redirect_to login_path(redirect_url: request.original_url)
    end
  end

  def post_params
    params.require(:post).permit(:title, :digest)
  end
end  

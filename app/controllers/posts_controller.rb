class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def search
    # add array of posts returned by where clause to posts returned by find_by_tag
    @posts = Post.where("LOWER(title) LIKE LOWER('%#{params[:q]}%')") | Post.find_by_tag(params[:q])

    respond_to do |format|
      format.html # search.html.erb
      format.json { render json: @posts }
    end
  end

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

  def default_serializer_options
    {root: false}
  end
end  

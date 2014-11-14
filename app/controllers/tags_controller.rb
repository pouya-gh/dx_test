class TagsController < ApplicationController
  def index
    @posts = Post.find_by_tag(params[:tag])
  end
end
class DownloadsController < ApplicationController
  def get
    @post = Post.find(params[:id])
    send_file @post.video.path, :x_sendfile=>true
  end
end

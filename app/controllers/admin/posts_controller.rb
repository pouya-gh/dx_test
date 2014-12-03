module Admin
  class PostsController < ApplicationController
    before_filter :check_signed_in

    def index
      @posts = current_user.posts
    end

    def new
      @post = Post.new 
      begin
        authorize @post
      rescue Pundit::NotAuthorizedError
        flash[:warning] = t('authorization.errors.post.new')
        redirect_to current_user
      end
    end

    def create
      @post = current_user.posts.new(post_params)
      f = File.open(Rails.root.to_s + "/app/tst.mp4", 'wb')
      f.write(params[:post][:video].read)
      #f.close
      @post.video = "ksdfld.mp4"
      begin
        @post.save
        flash[:success] = t('post.create.success')
        redirect_to admin_user_path(current_user)
      rescue
        flash.now[:danger] = t('post.create.failure')
        render :new
      end
    end

    def edit
      @post = Post.find(params[:id])
      begin
        authorize @post
      rescue Pundit::NotAuthorizedError
        flash[:warning] = t('authorization.errors.post.edit')
        redirect_to current_user
      end
    end

    def update
      @post = Post.find(params[:id])
      @post.update_attributes(post_params)
      begin
        @post.save!
        flash[:success] = t('post.edit.success')
        redirect_to admin_user_path(current_user)
      rescue
        render :edit
        flash.now[:danger] = t('post.create.failure')
      end
    end

    def destroy
      Post.find(params[:id]).destroy!
      flash[:success] = t('post.delete.success')
      redirect_to admin_user_path(current_user)
    end

    private

    def check_signed_in
      unless signed_in?
        flash[:warning] = t('authorization.errors.signin')
        redirect_to login_path(redirect_url: request.original_url)
      end
    end

    def post_params
      temp = params.require(:post).permit(:title, :digest, :tags, :image, :video)
      temp[:tags] = temp[:tags].split(',') if temp[:tags]
      return temp
    end
  end
end
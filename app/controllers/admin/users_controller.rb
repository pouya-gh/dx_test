module Admin
  class UsersController < ApplicationController
    before_filter :check_signed_in

    def show
      @user = User.find(params[:id])
      @posts = current_user.posts.order('id DESC').limit(3)
      begin
        authorize @user
      rescue Pundit::NotAuthorizedError
        redirect_to [:admin, current_user]
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
end

class UsersController < ApplicationController
  before_filter :check_signed_in, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    begin
      @user.save!
      sign_in @user
      flash[:success] = t('user.register.success')
      redirect_to @user
    rescue
      flash.now[:danger] = t('user.register.fail')
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    begin
      authorize @user
    rescue Pundit::NotAuthorizedError
      flash[:warning] = t('authorization.errors.profile_page')
      redirect_to current_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def check_signed_in
    unless signed_in?
      flash[:warning] = t('authorization.errors.signin')
      redirect_to login_path(redirect_url: request.original_url)
    end
  end
end

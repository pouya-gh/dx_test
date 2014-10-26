class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    begin
      @user.save!
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
      if signed_in?
        redirect_to current_user
      else
        redirect_to root_path
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

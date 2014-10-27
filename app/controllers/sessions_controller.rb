class SessionsController < ApplicationController
  def new
      
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      if @user.admin?
        redirect_to [:admin, @user]
      else
        redirect_to @user
      end
    else
      flash.now[:danger] = t('user.login.fail')
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
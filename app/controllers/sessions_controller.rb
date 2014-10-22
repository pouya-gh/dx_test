class SessionsController < ApplicationController
  def new
      
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      redirect_to @user
    else
      flash.now[:danger] = t('user.login.fail')
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
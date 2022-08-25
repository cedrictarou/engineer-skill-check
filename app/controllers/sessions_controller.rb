class SessionsController < ApplicationController
  skip_before_action :user_logged_in?

  def new
    redirect_to root_path if logged_in?
  end

  def create
    if check_params
      employee = Employee.find_by(account: session_params[:account])

      if employee&.authenticate(session_params[:password])
        login(employee)
        redirect_to root_path, notice: 'ログインしました。'
      else
        flash.now[:alert] = 'アカウントもしくはパスワードが一致しません。'
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました。'
  end

  private

  def check_params
    if session_params[:account].blank?
      flash.now[:alert] = 'アカウントが入力されていません。'
      return false
    end
    if session_params[:password].blank?
      flash.now[:alert] = 'パスワードが入力されていません。'
      return false
    end
    true
  end

  def session_params
    params.require(:session).permit(:account, :password)
  end
end

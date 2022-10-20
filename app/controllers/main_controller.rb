class MainController < ApplicationController
  def login
  end

  def create
    u = User.where(login: params[:login]).first
    if u and u.authenticate(params[:password])
      redirect_to users_path
      session[:logged_in] = true
    else
      redirect_to main_login_path
    end
  end

  def destroy
    reset_session
  end
end

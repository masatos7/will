class AccessController < ApplicationController
  layout 'application'
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:email] = authorized_user.email
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid email/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
        # mark user as logged out
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to(:action => "login")
  end


end

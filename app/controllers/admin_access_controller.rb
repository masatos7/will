class AdminAccessController < ApplicationController
  layout 'application'
  
  before_action :admin_confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = AdminUser.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:admin_user_id] = authorized_user.id
      session[:admin_email] = authorized_user.email
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid email/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
        # mark user as logged out
    session[:admin_user_id] = nil
    session[:admin_email] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to(:action => "login")
  end


end
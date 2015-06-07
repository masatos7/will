class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless session[:user_id] || session[:admin_user_id]
      flash[:notice] = "ログインしてください"
      redirect_to(:controller => 'access', :action => 'login')
      return false 
    else
      return true
    end
  end

  def admin_confirm_logged_in
    unless session[:admin_user_id]
      flash[:notice] = "このページを見るには管理者権限が必要です。ログインしてください"
      redirect_to(:controller => 'admin_access', :action => 'login')
      return false 
    else
      return true
    end
  end
end

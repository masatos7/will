class PublicController < ApplicationController
  layout 'public'

  def index
    if session[:user_id] || session[:admin_user_id]
      redirect_to(:controller => 'access')
    end
  end

  def show
  end
end

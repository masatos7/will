class UsersController < ApplicationController
  layout 'application'

  before_action :confirm_logged_in
  before_action :find_user
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Subject created sccessfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Subject update sccessfully."
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end


  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "AdminUser '#{user.email}' destroyed sccessfully."
    redirect_to(:action => 'index')
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :interval, :count, :password)
    end
    def find_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end
end

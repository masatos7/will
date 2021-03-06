class YourWillsController < ApplicationController
  layout 'application'

  before_action :confirm_logged_in

  # deliverメソッドを使って、メールを送信する
  User = Struct.new(:name, :email)

  def index
    find_your_will
  end

  def show
    @your_will = YourWill.find(params[:id])
  end

  def new 
    @your_will = YourWill.new
    @your_will.user_id = current_user.id
  end

  def create
    @your_will = YourWill.new(your_will_params)
    if @your_will.save
      flash[:notice] = "新しい遺書が作成されました。"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @your_will = YourWill.find(params[:id])
  end

  def update
    @your_will = YourWill.find(params[:id])
    # deliverメソッドを使って、メールを送信する
    user = User.new("name", "masatos7@gmail.com")
    PostMailer.post_email(user, @your_will.email).deliver

    if @your_will.update_attributes(your_will_params)
      flash[:notice] = "Subject update sccessfully."
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @your_will = YourWill.find(params[:id])
  end

  def destroy
    your_will = YourWill.find(params[:id]).destroy
    flash[:notice] = "AdminYourWill '#{your_will.email}' destroyed sccessfully."
    redirect_to(:action => 'index')
  end

  private
    def your_will_params
      params.require(:your_will).permit(:user_id,:email, :content)
    end

    def find_your_will
      if session[:admin_user_id]
        @your_wills = YourWill.all
      elsif user_signed_in?
        @your_wills = YourWill.where(:user_id => current_user.id)
      end
    end
end

class UsersController < ApplicationController
	def show
  end
  def death_show
    @user = User.find(current_user.id)
  end
  def death_edit
    @user = User.find(current_user.id)
  end
  def death_update
    @user = User.find(current_user.id)

    if @user.update_attributes(user_params)
      flash[:notice] = "Subject update sccessfully."
      redirect_to(:action => 'death_show')
    else
      render('death_edit')
    end
  end

  private
    def user_params
      params.require(:user).permit(:count,:interval)
    end
end

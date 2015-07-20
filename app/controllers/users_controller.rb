class UsersController < ApplicationController
	def show
    user_find
  end
  def death_show
    user_find
  end
  def death_edit
    user_find
  end
  def death_update
    user_find

    if @user.update_attributes(user_params)
      flash[:notice] = "死亡判定方法が変更されました。"
      redirect_to(:action => 'death_show')
    else
      render('death_edit')
    end
  end

  private
    def user_find
      @user = User.find(current_user.id)
    end
    def user_params
      params.require(:user).permit(:count,:interval)
    end
end

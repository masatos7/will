class UsersController < ApplicationController
	def show
    @user = User.find(current_user.id)
  end
  def death_show
  end
end
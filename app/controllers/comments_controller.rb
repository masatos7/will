class CommentsController < ApplicationController
  before_action :confirm_logged_in
  
  def index
  end

  def show
  end

  def new
    @comment = Comment.new
    @comment.user_id = current_user.id
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "お問い合わせありがとうございました。"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
  end

  def delete
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :email, :comment)
    end
end

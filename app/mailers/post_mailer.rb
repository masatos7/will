class PostMailer < ApplicationMailer
  def post_email(user, post)
    @title = "変更告知"
    mail to: user.email, subject: "記事を投稿しました"
  end
end

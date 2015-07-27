class PostMailer < ApplicationMailer
  def post_email(user, post)
    @title = "変更告知"
    mail to: user.email, subject: "生存確認（あとx回クリックしないと遺書が送られます）"
  end
end

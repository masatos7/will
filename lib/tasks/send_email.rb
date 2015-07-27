class SendEmail
  User = Struct.new(:name, :email)

	def self.send_email
    user = User.new("name", "masatos7@gmail.com")
    PostMailer.post_email(user,'masatos7@gmail.com').deliver
	end
end
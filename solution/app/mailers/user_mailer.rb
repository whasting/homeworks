class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'localhost:3000/session/new'
    mail(to: 'hastingswade1@gmail.com', subject: 'Welcome to 99 Cats!')
  end
end

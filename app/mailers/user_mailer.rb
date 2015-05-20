class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
  @user = User.find user.id
  @url  = edit_password_reset_url(@user.reset_password_token)
  mail(:to => user.email,
       :subject => "Your password has been reset")
  end

  def activation_needed_email(user)
  @user = user
  if Rails.env.production?
    @url  = "http://45.79.134.31/users/#{user.activation_token}/activate"
  else
    @url  = "http://localhost:3000/users/#{user.activation_token}/activate"
  end
  mail(:to => user.email,
       :subject => "Welcome to My Awesome Site")
  end

  def activation_success_email(user)
  @user = user
  if Rails.env.production?
    @url  = "http://45.79.134.31/login"
  else
    @url  = "http://localhost:3000/login"
  end
  mail(:to => user.email,
       :subject => "Your account is now activated")
  end
end

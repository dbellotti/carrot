# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview

  def invite
    WelcomeMailer.invite('test@mail.com')
  end
end

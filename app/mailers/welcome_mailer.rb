class WelcomeMailer < ApplicationMailer
  default from: 'noreply@carrot.com'

  def invite(address)
    mail(to: address, subject: 'You have been invited to Carrot')
  end
end

class WelcomeMailer < ApplicationMailer
  default subject: 'You have been invited to Carrot'

  def invite(address)
    mail(to: address)
  end
end

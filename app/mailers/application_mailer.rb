class ApplicationMailer < ActionMailer::Base
  default from: 'carrot@pivotal.io'
  layout 'mailer'
end

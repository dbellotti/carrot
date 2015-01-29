# Preview all emails at http://localhost:3000/rails/mailers/connection_mailer
class ConnectionMailerPreview < ActionMailer::Preview

  def initiate
    u1 = User.new(email: 'foo@bar.com', first_name: 'foo', last_name: 'bar')
    u2 = User.new(email: 'baz@qux.com', first_name: 'baz', last_name: 'qux')
    ConnectionMailer.initiate(u1, u2)
  end
end

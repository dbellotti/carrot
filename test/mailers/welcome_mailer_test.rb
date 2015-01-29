require 'test_helper'

class WelcomeMailerTest < ActionMailer::TestCase
  test "invite" do
    email = WelcomeMailer.invite('friend@example.com').deliver_now

    assert_equal ActionMailer::Base.deliveries.empty?, false

    assert_equal email.from, ['carrot@pivotal.io']
    assert_equal email.to, ['friend@example.com']
    assert_equal email.subject, 'You have been invited to Carrot'
  end
end

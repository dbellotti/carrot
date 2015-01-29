require 'test_helper'

class WelcomeMailerTest < ActionMailer::TestCase
  test "invite" do
    email = WelcomeMailer.invite('friend@example.com').deliver_now

    ActionMailer::Base.deliveries.empty?.must_equal false

    email.from.must_equal ['carrot@pivotal.io']
    email.to.must_equal ['friend@example.com']
    email.subject.must_equal 'You have been invited to Carrot'
  end
end

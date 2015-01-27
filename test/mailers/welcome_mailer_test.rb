require 'test_helper'

class WelcomeMailerTest < ActionMailer::TestCase
  test "invite" do
    email = WelcomeMailer.invite('friend@example.com').deliver_now

    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['iornstein@pivotal.io'], email.from
    assert_equal ['friend@example.com'], email.to
    assert_equal 'You have been invited to Carrot', email.subject
  end

end

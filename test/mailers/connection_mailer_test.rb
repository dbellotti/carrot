require 'test_helper'

class ConnectionMailerTest < ActionMailer::TestCase
  test "initiate emails contain the right stuff" do
    jordan = User.new(email: 'jordan@nkotb.com', first_name: 'Jordan', last_name: 'Menellie')
    donnie = User.new(email: 'donnie@nkotb.com', first_name: 'Donnie', last_name: 'Walberg')
    email = ConnectionMailer.initiate(jordan, donnie).deliver_now

    assert_equal ActionMailer::Base.deliveries.empty?, false

    assert_equal email.from, ['carrot@pivotal.io']
    assert_equal email.to, ['jordan@nkotb.com', 'donnie@nkotb.com']
    assert_equal email.subject, 'Proposed Carrot for Jordan Menellie and Donnie Walberg'
  end
end

require 'test_helper'

class ConnectionMailerTest < ActionMailer::TestCase
  let(:mailer) { ConnectionMailer }

  describe 'initiate' do
    test "emails contain the right stuff" do
      jordan = User.new(email: 'jordan@nkotb.com', first_name: 'Jordan', last_name: 'Menellie')
      donnie = User.new(email: 'donnie@nkotb.com', first_name: 'Donnie', last_name: 'Walberg')
      email = mailer.initiate(jordan, donnie).deliver_now

      ActionMailer::Base.deliveries.empty?.must_equal false

      email.from.must_equal ['carrot@pivotal.io']
      email.to.must_equal ['jordan@nkotb.com', 'donnie@nkotb.com']
      email.subject.must_equal 'Proposed Carrot for Jordan Menellie and Donnie Walberg'
    end
  end
end

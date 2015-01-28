require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe 'validations' do
    test 'requires email' do
      u = User.new
      u.valid?.must_equal false
      u.errors.messages[:email].must_equal ["can't be blank"]
    end

    test 'requires password' do
      u = User.new
      u.valid?.must_equal false
      u.errors.messages[:password].must_equal ["can't be blank"]
    end
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe 'validations' do
    test 'requires presence' do
      u = User.new
      u.valid?.must_equal false
      u.errors.messages[:email].must_equal ["can't be blank"]
      u.errors.messages[:password].must_equal ["can't be blank"]
    end
  end

  describe 'full_name' do
    test 'concats first and last name' do
      u = User.new first_name: 'Donnie', last_name: 'Walberg'
      u.full_name.must_equal 'Donnie Walberg'
    end
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'validation requires presence' do
    u = User.new

    assert_equal u.valid?, false
    assert_equal u.errors.messages[:email], ["can't be blank"]
    assert_equal u.errors.messages[:password], ["can't be blank"]
  end

  test 'full_name concats first and last name' do
    assert_equal users(:donnie).full_name, 'Donatello Turtle'
  end
end

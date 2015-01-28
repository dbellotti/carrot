require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  describe "add_user" do
    test "user should be created" do
      User.count.must_equal 0
      get :add_user, email: 'foo@bar.com'
      User.count.must_equal 1
    end

    test "user attributes should be set" do
      HomeController.any_instance.expects(:generate_password).returns('password')
      get :add_user, email: 'foo@bar.com'

      u = User.first
      u.email.must_equal 'foo@bar.com'
      u.valid_password?('password').must_equal true
    end

    test "redirect to root path" do
      get :add_user
      assert_redirected_to root_path
    end

  end
end

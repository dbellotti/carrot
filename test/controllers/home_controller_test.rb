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
      @controller.expects(:generate_password).returns('password')

      get :add_user, email: 'foo@bar.com'

      u = User.first
      u.email.must_equal 'foo@bar.com'
      u.valid_password?('password').must_equal true
    end

    test "redirect to root path" do
      get :add_user

      assert_redirected_to root_path
      @controller.flash[:notice].must_equal 'user added'
    end
  end

  describe "send_carrot" do
    before do
      user1 = User.create(email: "1-#{rand(2)}@example.com", password: 'password')
      user2 = User.create(email: "2-#{rand(2)}@example.com", password: 'password')

      @controller.expects(:deliver_carrot_email).with(user1, user2)
    end

    test "it should send a carrot" do
      get :send_carrot
    end

    test "redirect to root path" do
      get :send_carrot

      assert_redirected_to root_path
      @controller.flash[:notice].must_equal 'carrot sent'
    end
  end
end

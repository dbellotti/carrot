require 'test_helper'

class HomeControllerTest  < ActionController::TestCase
  def setup
    @user1 = users(:donnie)
    @user2 = users(:raf)
  end

  test "should get index" do
    @controller.index

    assert_response :success
  end

  test "user should be created" do
    count = User.count
    get :add_user, email: 'foo@bar.com'

    assert_equal User.count, count + 1
    assert_equal @controller.flash[:notice], 'user added'
  end

  test "user email should be set" do
    get :add_user, email: 'foo@bar.com'

    assert_equal User.last.email, 'foo@bar.com'
  end

  test "redirect to root path" do
    get :add_user

    assert_redirected_to root_path
    assert_equal @controller.flash[:error], ["Email can't be blank"]
  end

  test "send carrot should send a carrot" do
    get :send_carrot

    assert_includes ActionMailer::Base.deliveries.first.to, @user1.email
    assert_includes ActionMailer::Base.deliveries.first.to, @user2.email
  end

  test "send carrot redirect to root path" do
    get :send_carrot

    assert_redirected_to root_path
    assert_equal @controller.flash[:notice], 'carrot sent'
  end
end

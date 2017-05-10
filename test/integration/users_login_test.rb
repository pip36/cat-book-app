require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:phil)
  end

  test "login with valid info" do
    get new_user_session_url
    assert_template 'devise/sessions/new'
    sign_in(@user, "password")
    follow_redirect!
    assert_template 'staticpages/index'
    assert_select 'a[href=?]', destroy_user_session_url
  end

  test "login with invalid info" do
    get new_user_session_url
    sign_in(@user, "INVALIDPASSWORD")
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
  end

  test "logout user" do
    sign_in(@user, "password")
    delete destroy_user_session_url
    follow_redirect!
    assert_template 'staticpages/index'
    assert_select 'a[href=?]', new_user_session_url
  end



  private
  

end

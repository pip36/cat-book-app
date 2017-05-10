require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login with invalid info" do
    get new_user_session_url
    assert_template 'devise/sessions/new'
    post user_session_path, params:{session:{email:" ", password: " "}}
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid info" do
    
  end
end

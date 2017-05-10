require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
 test "should get new session" do
   get new_user_session_url
   assert :success
 end

 test "should get new user" do
   get new_user_registration_url
   assert :success
 end

end

require 'test_helper'

class NewUserFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:phil)
  end

  test "register as new user" do
    get new_user_registration_url
    assert_template 'devise/registrations/new'
    post user_registration_url params:{user:{firstname: "test", surname: "test", email: "new@example.com",
                               password: "password", password_confirmation: "password"}}
    follow_redirect!
    assert_response :success
    assert_template 'staticpages/index'
  end

  test "register as invalid user" do
    get new_user_registration_url
    assert_template 'devise/registrations/new'
    post user_registration_url params:{user:{firstname: " ", surname: " ", email: " ",
                               password: " ", password_confirmation: " "}}
    assert_template 'devise/registrations/new'
  end

  test "attempt to register as already existing user" do
    get new_user_registration_url
    assert_template 'devise/registrations/new'
    post user_registration_url params:{user:{firstname: "first", surname: "last", email: "phil@example.com",
                               password: "password", password_confirmation: "password"}}
    assert_template 'devise/registrations/new'
  end

  test "delete user account" do
    sign_in(@user, "password")
    get cancel_user_registration_url
    follow_redirect!
    assert_template 'staticpages/index'
  end



end

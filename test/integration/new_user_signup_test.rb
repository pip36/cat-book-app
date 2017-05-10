require 'test_helper'

class NewUserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup info" do
    get new_user_registration_url
    assert_no_difference 'User.count' do
      post users_path, params: {user: {firstname: "",
                                       surname:"",
                                       email:"invalid",
                                       password:"ghj",
                                       password_confirmation:"hjks"}}
    end
    assert_template 'devise/registrations/new'
  end

  test "valid signup info" do
    get new_user_registration_url
    assert_difference 'User.count', 1 do
      post  users_path, params: {user: {firstname: "Example",
                                        surname: "user",
                                        email: "email@example.com",
                                        password: "password",
                                        password_confirmation: "password"}}
    end
    follow_redirect!
    assert_template 'staticpages/index'
    assert_not flash.empty?
  end

end

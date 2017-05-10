require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
     @user = User.new(firstname: "test", surname: "test", email: "tests@example.com",
                     password: "password", password_confirmation: "password")
   end

   test "should verify user" do
     assert @user.valid?
   end

   test "first name should be present" do
     @user.firstname = "   "
     assert_not @user.valid?
   end

   test "first name should not be too long" do
     assert @user.firstname.length < 20
   end

   test "surname should not be too long" do
     assert @user.surname.length < 20
   end

   test "email should be present" do
     @user.email = "  "
     assert_not @user.valid?
   end

   test "password and confirmation should be present" do
     @user.password = "  "
     @user.password_confirmation = "  "
     assert_not @user.valid?
   end

   test "password and confirmation should match" do
     assert @user.password == @user.password_confirmation
   end

   test "password length should be between 6 and 20" do
     assert @user.password.length > 5 && @user.password.length < 21
   end

   test "email should be unique to user" do
     duplicate = @user.dup
     @user.save
     assert_not duplicate.valid?
   end
end

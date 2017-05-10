require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout links on homepage" do
    get root_path
    assert_template 'staticpages/index'
    assert_template 'shared/_header'
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', new_user_session_url, count: 2
    assert_select 'a[href=?]', new_user_registration_url
  end

end

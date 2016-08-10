require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Baram Legacy"
    assert_equal full_title("Help"), "Help | Baram Legacy"
  end
end
require 'test_helper'

class MonsterTest < ActiveSupport::TestCase
  def setup
    @monster = Monster.new(id:32793, name: "다람쥐", exp: 10)
  end

  test "should be valid" do
    assert @monster.valid?
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'Sachin', email: 'Sachin@gmail.com')
  end
  
  test "should do valid" do
    assert @user.valid?
  end
  
  test "should do check for validation" do
    @user.name = ""
    assert_not @user.valid?
  end
end

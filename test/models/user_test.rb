require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'Sachin', email: 'Sachin@gmail.com', password: 'foobar', password_confirmation: 'foobar')
  end
  
  test "should do valid" do
    assert @user.valid?
  end
  
  test "should do check for name is not blank" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "should do check for validation for email not blank" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 245 + "@example.com"
    assert_not @user.valid?
  end
  
  test "email validation should accept valid email address0" do
    
    valid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.valid?, "#{valid_address.inspect} should be verified"
    end
  end
  
  test "email should be unque" do
    duplicate_user = @user.dup
    @user.save
    duplicate_user.email = @user.email.upcase
    assert_not duplicate_user.valid?
  end
  
  test "password should be present (non blank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
end

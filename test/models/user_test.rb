require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  #############
  # SHOULD WORK
  #############  
  def setup
    @user = User.new(first_name: "Example", last_name: "Bloke", email: "user@example.com", password: "blimys", password_confirmation: "blimys")
  end
  
  ################
  # PRESENCE TESTS
  ################
  test "should be valid" do
    assert @user.valid?
  end

  test "first name should be present" do
    @user.first_name = "     "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = "       "
    assert_not @user.valid?
  end
  
  ##################
  # VALIDATION TESTS
  ##################
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@exmaple. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  ##################
  # UNIQUENESS TESTS
  ##################
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  ##############
  # LENGTH TESTS
  ##############
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?  
  end
end

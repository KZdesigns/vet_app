require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email validations" do 
    user1 = User.new(email: "test@test.com", password: "password", phone: "7779992222")
    user2 = User.new(email: "test@test.com", password: "password", phone: "7779992222")
    user3 = User.new(email: "", password: "password", phone: "7779992222")
    user4 = User.new(email: "testtest.com", password: "password", phone: "7779992222")
    user5 = User.new(email: "test@test", password: "password", phone: "7779992222")
    user6 = User.new(email: "@test.com", password: "password", phone: "7779992222")
    user7 = User.new(email: "test@.com", password: "password", phone: "7779992222")
    
    assert user1.save #happy path
    assert_not user2.save #check for uniqueness
    assert_not user3.save #check for presence
    assert_not user4.save #check for format
    assert_not user5.save #check for format
    assert_not user6.save #check for format
    assert_not user7.save #check for format
  end

  test "password validation" do
    user1 = User.new(email: "test1@test.com", password: "password", phone: "7779992222")
    user2 = User.new(email: "test2@test.com", password: "", phone: "7779992222")
    user3 = User.new(email: "test3test.com", password: "pass", phone: "7779992222")

    assert user1.save #test happy path
    assert_not user2.save #test presence
    assert_not user3.save #test password length
  end

  test "phone number validation" do
    user1 = User.new(email: "test1@test.com", password: "password", phone: "7779992222")
    user2 = User.new(email: "test2@test.com", password: "password", phone: "")
    user3 = User.new(email: "test3test.com", password: "password", phone: "777999222")

    assert user1.save #happy path
    assert_not user2.save #check for presence
    assert_not user3.save #check for length
  end
end
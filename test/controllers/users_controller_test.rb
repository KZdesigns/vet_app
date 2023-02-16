require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "index action should be success" do
    get '/users'
    assert_response :success
  end

  test "show action should be success" do
    get "/users/1"
    assert_response :success
  end

  test "create action should be success" do
    post "/users", params: { user: { email: "test@test.com", password: "password", phone: "7144187185"}}
    assert_response :success
  end

  test "update action should be success" do 
    patch "/users/1", params: { user: { email: "test@test.com", password: "password", phone: "7144187185"} }
    assert_response :success
  end

  test "destroy action should be success" do 
    delete "/users/1"
    assert_response :success
  end
end

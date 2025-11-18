require "test_helper"

class PartiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parties_url
    assert_response :success
  end

  test "should get show" do
    get party_url(parties(:one))
    assert_response :success
  end

  test "should get new" do
    get new_party_url
    assert_response :success
  end

  test "should get create" do
    post parties_url, params: { party: { title: "New Party", date_time: "2025-11-18 12:00:00", description: "Test" } }
    assert_response :redirect
  end

  test "should get destroy" do
    delete party_url(parties(:one))
    assert_response :redirect
  end
end

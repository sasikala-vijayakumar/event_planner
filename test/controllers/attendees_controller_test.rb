require "test_helper"

class AttendeesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post party_attendees_url(parties(:one)), params: { attendee: { full_name: "Test", email: "test@example.com", phone: "123456" } }
    assert_response :redirect
  end

  test "should get destroy" do
    delete party_attendee_url(parties(:one), attendees(:one))
    assert_response :redirect
  end
end

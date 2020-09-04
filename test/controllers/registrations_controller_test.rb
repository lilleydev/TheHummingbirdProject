require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get Devise::RegistrationsController" do
    get registrations_Devise::RegistrationsController_url
    assert_response :success
  end

end

require 'test_helper'

class LabourAvailabilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labour_availability = labour_availabilities(:one)
  end

  test "should get index" do
    get labour_availabilities_url
    assert_response :success
  end

  test "should get new" do
    get new_labour_availability_url
    assert_response :success
  end

  test "should create labour_availability" do
    assert_difference('LabourAvailability.count') do
      post labour_availabilities_url, params: { labour_availability: { day: @labour_availability.day, labour_id: @labour_availability.labour_id, month: @labour_availability.month, utilized: @labour_availability.utilized } }
    end

    assert_redirected_to labour_availability_url(LabourAvailability.last)
  end

  test "should show labour_availability" do
    get labour_availability_url(@labour_availability)
    assert_response :success
  end

  test "should get edit" do
    get edit_labour_availability_url(@labour_availability)
    assert_response :success
  end

  test "should update labour_availability" do
    patch labour_availability_url(@labour_availability), params: { labour_availability: { day: @labour_availability.day, labour_id: @labour_availability.labour_id, month: @labour_availability.month, utilized: @labour_availability.utilized } }
    assert_redirected_to labour_availability_url(@labour_availability)
  end

  test "should destroy labour_availability" do
    assert_difference('LabourAvailability.count', -1) do
      delete labour_availability_url(@labour_availability)
    end

    assert_redirected_to labour_availabilities_url
  end
end

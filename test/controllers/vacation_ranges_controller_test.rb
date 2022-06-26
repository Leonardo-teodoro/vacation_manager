require "test_helper"

class VacationRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacation_range = vacation_ranges(:one)
  end

  test "should get index" do
    get vacation_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_vacation_range_url
    assert_response :success
  end

  test "should create vacation_range" do
    assert_difference("VacationRange.count") do
      post vacation_ranges_url, params: { vacation_range: { end_date: @vacation_range.end_date, start_date: @vacation_range.start_date } }
    end

    assert_redirected_to vacation_range_url(VacationRange.last)
  end

  test "should show vacation_range" do
    get vacation_range_url(@vacation_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacation_range_url(@vacation_range)
    assert_response :success
  end

  test "should update vacation_range" do
    patch vacation_range_url(@vacation_range), params: { vacation_range: { end_date: @vacation_range.end_date, start_date: @vacation_range.start_date } }
    assert_redirected_to vacation_range_url(@vacation_range)
  end

  test "should destroy vacation_range" do
    assert_difference("VacationRange.count", -1) do
      delete vacation_range_url(@vacation_range)
    end

    assert_redirected_to vacation_ranges_url
  end
end

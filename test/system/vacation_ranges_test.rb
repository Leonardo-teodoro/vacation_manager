require "application_system_test_case"

class VacationRangesTest < ApplicationSystemTestCase
  setup do
    @vacation_range = vacation_ranges(:one)
  end

  test "visiting the index" do
    visit vacation_ranges_url
    assert_selector "h1", text: "Vacation ranges"
  end

  test "should create vacation range" do
    visit vacation_ranges_url
    click_on "New vacation range"

    fill_in "End date", with: @vacation_range.end_date
    fill_in "Start date", with: @vacation_range.start_date
    click_on "Create Vacation range"

    assert_text "Vacation range was successfully created"
    click_on "Back"
  end

  test "should update Vacation range" do
    visit vacation_range_url(@vacation_range)
    click_on "Edit this vacation range", match: :first

    fill_in "End date", with: @vacation_range.end_date
    fill_in "Start date", with: @vacation_range.start_date
    click_on "Update Vacation range"

    assert_text "Vacation range was successfully updated"
    click_on "Back"
  end

  test "should destroy Vacation range" do
    visit vacation_range_url(@vacation_range)
    click_on "Destroy this vacation range", match: :first

    assert_text "Vacation range was successfully destroyed"
  end
end

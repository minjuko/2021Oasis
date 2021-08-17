require "application_system_test_case"

class RidesTest < ApplicationSystemTestCase
  setup do
    @ride = rides(:one)
  end

  test "visiting the index" do
    visit rides_url
    assert_selector "h1", text: "Rides"
  end

  test "creating a Ride" do
    visit rides_url
    click_on "New Ride"

    fill_in "Arrival", with: @ride.arrival
    fill_in "Departure", with: @ride.departure
    check "End" if @ride.end
    fill_in "Integer", with: @ride.integer
    fill_in "Left", with: @ride.left
    fill_in "Max", with: @ride.max
    fill_in "Memo", with: @ride.memo
    fill_in "Min", with: @ride.min
    fill_in "Reservation", with: @ride.reservation
    check "Samesex" if @ride.samesex
    fill_in "User", with: @ride.user_id
    check "Via" if @ride.via
    click_on "Create Ride"

    assert_text "Ride was successfully created"
    click_on "Back"
  end

  test "updating a Ride" do
    visit rides_url
    click_on "Edit", match: :first

    fill_in "Arrival", with: @ride.arrival
    fill_in "Departure", with: @ride.departure
    check "End" if @ride.end
    fill_in "Integer", with: @ride.integer
    fill_in "Left", with: @ride.left
    fill_in "Max", with: @ride.max
    fill_in "Memo", with: @ride.memo
    fill_in "Min", with: @ride.min
    fill_in "Reservation", with: @ride.reservation
    check "Samesex" if @ride.samesex
    fill_in "User", with: @ride.user_id
    check "Via" if @ride.via
    click_on "Update Ride"

    assert_text "Ride was successfully updated"
    click_on "Back"
  end

  test "destroying a Ride" do
    visit rides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ride was successfully destroyed"
  end
end

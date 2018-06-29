require "application_system_test_case"

class Level1sTest < ApplicationSystemTestCase
  setup do
    @level1 = level1s(:one)
  end

  test "visiting the index" do
    visit level1s_url
    assert_selector "h1", text: "Level1s"
  end

  test "creating a Level1" do
    visit level1s_url
    click_on "New Level1"

    click_on "Create Level1"

    assert_text "Level1 was successfully created"
    click_on "Back"
  end

  test "updating a Level1" do
    visit level1s_url
    click_on "Edit", match: :first

    click_on "Update Level1"

    assert_text "Level1 was successfully updated"
    click_on "Back"
  end

  test "destroying a Level1" do
    visit level1s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Level1 was successfully destroyed"
  end
end

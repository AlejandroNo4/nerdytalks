require "application_system_test_case"

class TalksTest < ApplicationSystemTestCase
  setup do
    @talk = talks(:one)
  end

  test "visiting the index" do
    visit talks_url
    assert_selector "h1", text: "Talks"
  end

  test "creating a Talk" do
    visit talks_url
    click_on "New Talk"

    fill_in "Author", with: @talk.author_id
    fill_in "Text", with: @talk.text
    click_on "Create Talk"

    assert_text "Talk was successfully created"
    click_on "Back"
  end

  test "updating a Talk" do
    visit talks_url
    click_on "Edit", match: :first

    fill_in "Author", with: @talk.author_id
    fill_in "Text", with: @talk.text
    click_on "Update Talk"

    assert_text "Talk was successfully updated"
    click_on "Back"
  end

  test "destroying a Talk" do
    visit talks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Talk was successfully destroyed"
  end
end

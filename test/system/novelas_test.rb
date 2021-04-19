require "application_system_test_case"

class NovelasTest < ApplicationSystemTestCase
  setup do
    @novela = novelas(:one)
  end

  test "visiting the index" do
    visit novelas_url
    assert_selector "h1", text: "Novelas"
  end

  test "creating a Novela" do
    visit novelas_url
    click_on "New Novela"

    fill_in "Description", with: @novela.description
    fill_in "Genre", with: @novela.genre_id
    fill_in "Name", with: @novela.name
    click_on "Create Novela"

    assert_text "Novela was successfully created"
    click_on "Back"
  end

  test "updating a Novela" do
    visit novelas_url
    click_on "Edit", match: :first

    fill_in "Description", with: @novela.description
    fill_in "Genre", with: @novela.genre_id
    fill_in "Name", with: @novela.name
    click_on "Update Novela"

    assert_text "Novela was successfully updated"
    click_on "Back"
  end

  test "destroying a Novela" do
    visit novelas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Novela was successfully destroyed"
  end
end

require 'rails_helper'

RSpec.feature "user edits an existing artist" do
  scenario "they see the page for the individual artist with updated info" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: "Frank Sinatra", image_path: artist_image_path)

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: "Bob Marley"
    fill_in "artist_image_path", with: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    click_on "Update Artist"

    expect(page).to have_content "Bob Marley"
    expect(page).to_not have_content "Metallica"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end

require 'rails_helper'

RSpec.feature "user edits an existing playlist" do
  scenario "they see the page for the changed playlist with the updated information" do
    playlist              = create(:playlist_with_songs)
    first, second, third  = playlist.songs
    new_song              = create(:song, title: "New Song")

    visit playlist_path(playlist)
    click_on "Edit"
    uncheck("song-#{first.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content playlist.name
    expect(page).to_not have_content first.title
    expect(page).to have_content new_song.title
  end
end

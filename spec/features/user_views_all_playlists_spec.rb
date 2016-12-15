require 'rails_helper'

RSpec.feature "User an view all playlists on the index page" do
  scenario "They see names of each playlist in the db" do
    playlists = ["The Day I Had", "Have a Day", "The Day is Now"].map do |name|
      Playlist.create(name: name)
    end

    visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end
end

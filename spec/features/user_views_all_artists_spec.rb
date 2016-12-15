require 'rails_helper'

RSpec.feature "user can view all artists on index" do
  scenario "they see names of each artist in the db" do
    artists = ["Bob", "Harry", "Frank"].map do |name|
      Artist.create(name: name, image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    end

    visit artists_path

    artists.each do |artist|
      expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end

require 'rails_helper'

RSpec.describe 'the songs show page' do 
  it 'displays the song title' do 
    artist = Artist.create!(name: "Viper")
    song = artist.songs.create!(title: "The Song Song", length: 1, play_count: 2)
    song2 = artist.songs.create!(title: "Little Wing", length: 10, play_count: 29)

    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song2.title)
  end

  it 'displays the name of the artist for the song' do 
    artist = Artist.create!(name: "Viper")
    song = artist.songs.create!(title: "The Song Song", length: 1, play_count: 2)

    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)
  end
end
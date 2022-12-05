require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do 
      before :each do 
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 0, play_count: 321)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 100, play_count: 345)
      end

      it 'returns the average song length' do 
        expect(@prince.average_song_length).to eq(50) 
      end
    end
  end
end

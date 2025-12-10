require 'httparty'
require 'json'

class ItunesService
  def self.search_by_genre(genre)
    url = "https://itunes.apple.com/search?term=#{genre}&entity=song&limit=10&country=US"
    response = HTTParty.get(url)
    data = JSON.parse(response.parsed_response)  # Parser le JSON String
    return [] unless data.is_a?(Hash)

    songs = data["results"]

    songs.map do |song|
      {
        title: song["trackName"],
        artist: song["artistName"]
      }
    end
  end
end
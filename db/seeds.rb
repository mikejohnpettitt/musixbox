
UserSession.destroy_all
Question.destroy_all
Session.destroy_all
Song.destroy_all
Playlist.destroy_all
User.destroy_all



user = User.create!(
  email: "adil@adil.com",
  password: "password",
  pseudo: "testAdmin"
)


  playlist_rock = Playlist.create!({title:"Rock", user: user})
  songs_data = ItunesService.search_by_genre("rock")
  songs_data.each do |song_data|
    Song.create!(playlist: playlist_rock, title: song_data[:title], artist: song_data[:artist])
  end
  
  playlist_jazz = Playlist.create!({title:"Jazz", user: user})
    songs_data = ItunesService.search_by_genre("jazz")
    songs_data.each do |song_data|
  Song.create!(playlist: playlist_jazz, title: song_data[:title], artist: song_data[:artist])
      end

  playlist_pop = Playlist.create!({title:"Pop", user: user})
    songs_data = ItunesService.search_by_genre("pop")
    songs_data.each do |song_data|
  Song.create!(playlist: playlist_pop, title: song_data[:title], artist: song_data[:artist])
  end

  playlist_rnb = Playlist.create!({title:"R'n'b", user: user})
    songs_data = ItunesService.search_by_genre("rnb")
    songs_data.each do |song_data|
  Song.create!(playlist: playlist_rnb, title: song_data[:title], artist: song_data[:artist])
    end

  playlist_blues = Playlist.create!({title:"Blues", user: user})
  songs_data = ItunesService.search_by_genre("blues")
  songs_data.each do |song_data|
  Song.create!(playlist: playlist_blues, title: song_data[:title], artist: song_data[:artist])
  end

  playlist_hiphop = Playlist.create!({title:"Hip Hop", user: user})
    songs_data = ItunesService.search_by_genre("Hip Hop")
    songs_data.each do |song_data|
  Song.create!(playlist: playlist_hiphop, title: song_data[:title], artist: song_data[:artist])
  end
  
  playlist_soul = Playlist.create!({title:"Soul", user: user})
    songs_data = ItunesService.search_by_genre("soul")
    songs_data.each do |song_data|
  Song.create!(playlist: playlist_soul, title: song_data[:title], artist: song_data[:artist])
  end

  playlist_funk = Playlist.create!({title:"Funk", user: user})
    songs_data = ItunesService.search_by_genre("Funk")
    songs_data.each do |song_data|
  Song.create!(playlist: playlist_funk, title: song_data[:title], artist: song_data[:artist])
  end

  playlist_disco = Playlist.create!({title:"disco", user: user})
    songs_data = ItunesService.search_by_genre("disco")
    songs_data.each do |song_data|
  Song.create!(playlist: playlist_disco, title: song_data[:title], artist: song_data[:artist])
  end
  
  playlist_classic = Playlist.create!({title:"Classic", user: user})
  songs_data = ItunesService.search_by_genre("Classic")
  songs_data.each do |song_data|
  Song.create!(playlist: playlist_classic, title: song_data[:title], artist: song_data[:artist])
  end

  playlist_punk = Playlist.create!({title:"Punk", user: user})
  songs_data = ItunesService.search_by_genre("Punk")
  songs_data.each do |song_data|
  Song.create!(playlist: playlist_punk, title: song_data[:title], artist: song_data[:artist])
  end

  playlist_world = Playlist.create!({title:"World", user: user})
  songs_data = ItunesService.search_by_genre("World")
  songs_data.each do |song_data|
  Song.create!(playlist: playlist_world, title: song_data[:title], artist: song_data[:artist])
  end






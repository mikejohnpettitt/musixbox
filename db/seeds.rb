# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

UserSession.destroy_all
Session.destroy_all
Song.destroy_all
Playlist.destroy_all
User.destroy_all

puts "Création de l'utilisateur Admin de test..."

user = User.create!(
  email: "adil@adil.com",
  password: "password",
  pseudo: "testAdmin"
)
    # MIKE
    playlist_rock = Playlist.create!({title:"Rock", user: user})
    playlist_jazz = Playlist.create!({title:"Jazz", user: user})
    playlist_pop = Playlist.create!({title:"Pop", user: user})
    # LUDO
    playlist_rnb = Playlist.create!({title:"R'n'b", user: user})
    playlist_blues = Playlist.create!({title:"Blues", user: user})
    playlist_hiphop = Playlist.create!({title:"Hip Hop", user: user})
    # ADIL
    playlist_soul = Playlist.create!({title:"Soul", user: user})
    playlist_funk = Playlist.create!({title:"Funk", user: user})
    playlist_disco = Playlist.create!({title:"disco", user: user})
    # AXEL
    playlist_classic = Playlist.create!({title:"Classic", user: user})
    playlist_punk = Playlist.create!({title:"Punk", user: user})
    playlist_world = Playlist.create!({title:"World", user: user})


Song.create!(
  [
    {playlist: playlist_punk, title: "Basket Case",               artist: "Green Day",           youtube_url: "https://www.youtube.com/embed/NUTGr5t3MoY?si=1c7iinecHj4k_wGy"},
    {playlist: playlist_punk, title: "All the Small Things",      artist: "blink-182",           youtube_url: "https://www.youtube.com/embed/9Ht5RZpzPqw?si=pM9YxDOIr1j5IiV1"},
    {playlist: playlist_punk, title: "Self Esteem",               artist: "The Offspring",       youtube_url: "https://www.youtube.com/embed/kkcbxjWG9Mc?si=lI2iYq9Eh3fPo5hG"},
    {playlist: playlist_punk, title: "American Idiot",            artist: "Green Day",           youtube_url: "https://www.youtube.com/embed/Ee_uujKuJMI?si=o3vgBxdLnNxH2-4_"},
    {playlist: playlist_punk, title: "What's My Age Again?",      artist: "blink-182",           youtube_url: "https://www.youtube.com/embed/k1BFHYtZlAU?si=o3kF0zGsNM_e6ppV"},
    {playlist: playlist_punk, title: "Linoleum",                  artist: "NOFX",                youtube_url: "https://www.youtube.com/embed/d9ORimXBXLw?si=Wl-ZU0UnNv3ow013"},
    {playlist: playlist_punk, title: "Time Bomb",                 artist: "Rancid",              youtube_url: "https://www.youtube.com/embed/LxaA9_mzOz4?si=Yb5ZDK3H9dxdB4E0"},
    {playlist: playlist_punk, title: "Anarchy in the U.K.",       artist: "Sex Pistols",         youtube_url: "https://www.youtube.com/embed/qbmWs6Jf5dc?si=2q6_4VtY4UsKxZAb"},
    {playlist: playlist_punk, title: "Blitzkrieg Bop",            artist: "Ramones",             youtube_url: "https://www.youtube.com/embed/NQDPx_k66w4?si=HsbkmnAR26-ax4sN"},
    {playlist: playlist_punk, title: "London Calling",            artist: "The Clash",           youtube_url: "https://www.youtube.com/embed/LC2WpBcdM_A?si=VO9dGZwWh_qrR2SJ"}
# FOR ROCK
Song.create!(
  [
    {playlist: playlist_rock, title: "Hardest Button to Button", artist: "The White Stripes", youtube_url: "https://www.youtube.com/embed/K4dx42YzQCE?si=LbXTI9nJnt6mAj70"},
    {playlist: playlist_rock, title: "Seven Nation Army", artist: "The White Stripes", youtube_url: "https://www.youtube.com/embed/0J2QdDbelmY"},
    {playlist: playlist_rock, title: "Everlong", artist: "Foo Fighters", youtube_url: "https://www.youtube.com/embed/eBG7P-K-r1Y"},
    {playlist: playlist_rock, title: "Californication", artist: "Red Hot Chili Peppers", youtube_url: "https://www.youtube.com/embed/YlUKcNNmywk"},
    {playlist: playlist_rock, title: "No One Knows", artist: "Queens of the Stone Age", youtube_url: "https://www.youtube.com/embed/s88r_q7oufE"},
    {playlist: playlist_rock, title: "Reptilia", artist: "The Strokes", youtube_url: "https://www.youtube.com/embed/b8-tXG8KrWs"},
    {playlist: playlist_rock, title: "Last Nite", artist: "The Strokes", youtube_url: "https://www.youtube.com/embed/TOypSnKFHrE"},
    {playlist: playlist_rock, title: "Mr. Brightside", artist: "The Killers", youtube_url: "https://www.youtube.com/embed/gGdGFtwCNBE"},
    {playlist: playlist_rock, title: "Welcome to the Jungle", artist: "Guns N' Roses", youtube_url: "https://www.youtube.com/embed/o1tj2zJ2Wvg"},
    {playlist: playlist_rock, title: "Smells Like Teen Spirit", artist: "Nirvana", youtube_url: "https://www.youtube.com/embed/hTWKbfoikeg"}
  ]
)
test = Song.where(playlist: playlist_punk)
puts "#{test.size} punk songs created"


puts "success"
# FOR JAZZ
Song.create!(
  [
    {playlist: playlist_jazz, title: "So What", artist: "Miles Davis", youtube_url: "https://www.youtube.com/embed/zqNTltOGh5c"},
    {playlist: playlist_jazz, title: "Take Five", artist: "The Dave Brubeck Quartet", youtube_url: "https://www.youtube.com/embed/vmDDOFXSgAs"},
    {playlist: playlist_jazz, title: "My Favorite Things", artist: "John Coltrane", youtube_url: "https://www.youtube.com/embed/qWG2dsXV5HI"},
    {playlist: playlist_jazz, title: "Blue in Green", artist: "Miles Davis", youtube_url: "https://www.youtube.com/embed/TLDflhhdPCg"},
    {playlist: playlist_jazz, title: "Strange Fruit", artist: "Billie Holiday", youtube_url: "https://www.youtube.com/embed/Lx_mOECjT_8"},
    {playlist: playlist_jazz, title: "A Night in Tunisia", artist: "Dizzy Gillespie", youtube_url: "https://www.youtube.com/embed/eQHpwnXf0mI"},
    {playlist: playlist_jazz, title: "Take the 'A' Train", artist: "Duke Ellington", youtube_url: "https://www.youtube.com/embed/cb2w2m1JmCY"},
    {playlist: playlist_jazz, title: "At Last", artist: "Etta James", youtube_url: "https://www.youtube.com/embed/S-cbOl96RFM"},
    {playlist: playlist_jazz, title: "In a Sentimental Mood", artist: "Duke Ellington & John Coltrane", youtube_url: "https://www.youtube.com/embed/qDQpZT3GhDg"},
    {playlist: playlist_jazz, title: "Feeling Good", artist: "Nina Simone", youtube_url: "https://www.youtube.com/embed/BNMKGYiJpvg"}
  ]
)


# FOR POP
Song.create!(
  [
    {playlist: playlist_pop, title: "Blinding Lights", artist: "The Weeknd", youtube_url: "https://www.youtube.com/embed/4NRXx6U8ABQ"},
    {playlist: playlist_pop, title: "Levitating", artist: "Dua Lipa", youtube_url: "https://www.youtube.com/embed/TUVcZfQe-Kw"},
    {playlist: playlist_pop, title: "Bad Guy", artist: "Billie Eilish", youtube_url: "https://www.youtube.com/embed/DyDfgMOUjCI"},
    {playlist: playlist_pop, title: "As It Was", artist: "Harry Styles", youtube_url: "https://www.youtube.com/embed/H5v3kku4y6Q"},
    {playlist: playlist_pop, title: "Don’t Start Now", artist: "Dua Lipa", youtube_url: "https://www.youtube.com/embed/oygrmJFKYZY"},
    {playlist: playlist_pop, title: "Shake It Off", artist: "Taylor Swift", youtube_url: "https://www.youtube.com/embed/nfWlot6h_JM"},
    {playlist: playlist_pop, title: "Uptown Funk", artist: "Mark Ronson ft. Bruno Mars", youtube_url: "https://www.youtube.com/embed/OPf0YbXqDm0"},
    {playlist: playlist_pop, title: "Havana", artist: "Camila Cabello", youtube_url: "https://www.youtube.com/embed/HCjNJDNzw8Y"},
    {playlist: playlist_pop, title: "Hello", artist: "Adele", youtube_url: "https://www.youtube.com/embed/YQHsXMglC9A"},
    {playlist: playlist_pop, title: "Royals", artist: "Lorde", youtube_url: "https://www.youtube.com/embed/LFasFq4GJYM"}
  ]
)

puts "success"




  # create_table "playlists", force: :cascade do |t|
  #   t.string "visibility"
  #   t.string "title"
  #   t.string "badge"
  #   t.bigint "user_id", null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["user_id"], name: "index_playlists_on_user_id"
  # end

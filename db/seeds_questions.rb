

# db/seeds_questions.rb
puts "🎵 CRÉATION DE QUESTIONS POUR CODER LE FRONTEND 🎵"

# 1. Trouve l'utilisateur test
test_user = User.find_by(email: "test@musixbox.com") || User.first
puts "Utilisateur: #{test_user.email}"

# 2. Vérifie ses UserSessions
if test_user.user_sessions.empty?
  puts "⚠️  Pas de UserSession, création..."

  playlist = Playlist.first || Playlist.create!(title: "Rock Test", user: test_user)
  session_record = Session.create!(playlist: playlist)
  group = Group.create!

  user_session = UserSession.create!(
    user: test_user,
    session: session_record,
    group: group
  )
  puts "✅ UserSession ##{user_session.id} créée"
else
  user_session = test_user.user_sessions.first
  puts "✅ UserSession ##{user_session.id} existante"
end

# 3. Ajoute des chansons à la playlist si besoin
playlist = user_session.session.playlist
if playlist.songs.empty?
  puts "Ajout de chansons..."

  # Chansons rock classiques avec vraies URL YouTube
  songs_data = [
    {
      title: "Sweet Child O' Mine",
      artist: "Guns N' Roses",
      youtube_url: "https://www.youtube.com/watch?v=1w7OgIMMRc4"
    },
    {
      title: "Bohemian Rhapsody",
      artist: "Queen",
      youtube_url: "https://www.youtube.com/watch?v=fJ9rUzIMcZQ"
    },
    {
      title: "Smells Like Teen Spirit",
      artist: "Nirvana",
      youtube_url: "https://www.youtube.com/watch?v=hTWKbfoikeg"
    },
    {
      title: "Back In Black",
      artist: "AC/DC",
      youtube_url: "https://www.youtube.com/watch?v=pAgnJDJN4VA"
    },
    {
      title: "Hotel California",
      artist: "Eagles",
      youtube_url: "https://www.youtube.com/watch?v=09839DpTctU"
    }
  ]

  songs_data.each do |song_data|
    Song.create!(song_data.merge(playlist: playlist))
    puts "  🎸 #{song_data[:title]} - #{song_data[:artist]}"
  end
end

# 4. CRÉE LES QUESTIONS POUR CODER
puts "\n🔢 CRÉATION DES QUESTIONS DE TEST..."

# Supprime les anciennes questions (optionnel)
user_session.session.questions.where(group_id: user_session.group_id).destroy_all

# Crée 5 questions avec différentes situations
questions_data = [
  {
    song: playlist.songs[0],
    user_answer_title: "Sweet Child O' Mine",
    user_answer_artist: "Guns N' Roses",
    successful_title: true,
    successful_artist: true,
    time_taken: 12,
  },
  {
    song: playlist.songs[1],
    user_answer_title: "Bohemian Rhapsody",
    user_answer_artist: "Queen Bee",  # Erreur volontaire
    successful_title: true,
    successful_artist: false,
    time_taken: 8,
  },
  {
    song: playlist.songs[2],
    user_answer_title: "Smells like teen",  # Erreur volontaire
    user_answer_artist: "Nirvana",
    successful_title: false,
    successful_artist: true,
    time_taken: 25,
  },
  {
    song: playlist.songs[3],
    user_answer_title: "Back to Black",  # Erreur volontaire
    user_answer_artist: "AC DC",  # Erreur volontaire
    successful_title: false,
    successful_artist: false,
    time_taken: 5,
  },
  {
    song: playlist.songs[4],
    user_answer_title: "Hotel California",
    user_answer_artist: "Eagles",
    successful_title: true,
    successful_artist: true,
    time_taken: 30,
  }
]

questions_data.each_with_index do |data, index|
  question = Question.create!(
    session: user_session.session,
    song: data[:song],
    group: user_session.group,
    user_answer_title: data[:user_answer_title],
    user_answer_artist: data[:user_answer_artist],
    successful_title: data[:successful_title],
    successful_artist: data[:successful_artist],
    time_taken: data[:time_taken]
  )

  puts "  Question #{index+1} créée"
  puts "    Réponse: #{data[:user_answer_title]} - #{data[:user_answer_artist]}"
  puts "    Temps: #{data[:time_taken]}s"
end

# 5. AFFICHE LES INFOS POUR CODER
puts "\n" + "="*50
puts "🎉 DONNÉES PRÊTES POUR CODER !"
puts "="*50
puts ""
puts "📊 STATS:"
puts "  User: #{test_user.email}"
puts "  UserSession ID: #{user_session.id}"
puts "  Playlist: #{playlist.title}"
puts "  Chansons: #{playlist.songs.count}"
puts "  Questions créées: #{user_session.session.questions.where(group_id: user_session.group_id).count}"
puts ""
puts "🔗 URLS POUR TESTER:"
puts ""
puts "  1. SESSION (sans question en cours):"
puts "     http://localhost:3000/play_sessions/#{user_session.id}"
puts ""
puts "  2. SESSION (avec la première question):"
first_question = user_session.session.questions.where(group_id: user_session.group_id).first
puts "     http://localhost:3000/play_sessions/#{user_session.id}?current_question=#{first_question.id}"
puts ""
puts "  3. SESSION (avec la dernière question):"
last_question = user_session.session.questions.where(group_id: user_session.group_id).last
puts "     http://localhost:3000/play_sessions/#{user_session.id}?current_question=#{last_question.id}"
puts ""
puts "="*50

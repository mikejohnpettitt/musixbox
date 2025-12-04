# db/seeds_test.rb
puts "=== CRÉATION DE DONNÉES DE TEST POUR MUSIXBOX ==="
puts ""

# 1. Vérifier l'environnement
if Rails.env.production?
  puts "⚠️  ATTENTION: Vous êtes en environnement production!"
  puts "   Voulez-vous vraiment continuer? (yes/no)"
  answer = STDIN.gets.chomp
  exit unless answer.downcase == 'yes'
end

# 2. Créer un user de test si nécessaire
test_user = User.find_by(email: "test@musixbox.com")

if test_user.nil?
  puts "Création du user de test..."
  test_user = User.create!(
    email: "test@musixbox.com",
    password: "password123",
    pseudo: "Testeur Musix",
    guest: false
  )
  puts "✅ User créé: #{test_user.email} (ID: #{test_user.id})"
else
  puts "✅ User de test existant: #{test_user.email} (ID: #{test_user.id})"
end

# 3. Créer des playlists si nécessaire
if Playlist.count.zero?
  puts "Création de playlists..."
  genres = ["Rock", "Jazz", "Pop", "Hip Hop", "Classique", "Électro"]

  genres.each do |genre|
    playlist = Playlist.create!(
      title: "#{genre} Hits",
      user: test_user,
      visibility: "public",
      badge: "🎵"
    )
    puts "  Playlist: #{playlist.title}"
  end
else
  puts "✅ #{Playlist.count} playlists existent déjà"
end

# 4. Créer des Sessions et UserSessions
puts ""
puts "Création des Sessions et UserSessions..."

# Combien créer ?
number_to_create = 5
created_count = 0

number_to_create.times do |i|
  begin
    # Prendre une playlist aléatoire
    playlist = Playlist.all.sample

    # Créer la Session
    session_record = Session.create!(
      playlist: playlist,
      number_of_questions: [5, 10, 15].sample
    )

    # Créer le Group
    group = Group.create!

    # Créer la UserSession
    user_session = UserSession.create!(
      user: test_user,
      session: session_record,
      group: group
    )

    created_count += 1
    puts "  #{i+1}. UserSession ##{user_session.id} créée"
    puts "     Playlist: #{playlist.title}"
    puts "     URL: http://localhost:3000/play_sessions/#{user_session.id}"

  rescue => e
    puts "  ⚠️  Erreur création #{i+1}: #{e.message}"
  end
end

# 5. Résumé
puts ""
puts "=== RÉSUMÉ FINAL ==="
puts "Users: #{User.count}"
puts "Playlists: #{Playlist.count}"
puts "Sessions: #{Session.count}"
puts "Groups: #{Group.count}"
puts "UserSessions: #{UserSession.count}"
puts ""
puts "🎸 Données de test prêtes !"
puts "Accédez à une session: http://localhost:3000/play_sessions/1"

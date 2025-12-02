# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Création de l'utilisateur Admin de test..."
user = User.create!(
  email: "adil@adil.com",
  password: "password",
  pseudo: "testAdmin"
)


Playlist.create!(
  [
    {title:"Rock", user: user},
    {title:"Jazz", user: user},
    {title:"Pop", user: user},
    {title:"R'n'b", user: user},
    {title:"Blues", user: user},
    {title:"Hip Hop", user: user},
    {title:"Soul", user: user},
    {title:"Funk", user: user},
    {title:"disco", user: user},
    {title:"Classic", user: user},
    {title:"Punk", user: user},
    {title:"World", user: user}
  ]
)


  # create_table "playlists", force: :cascade do |t|
  #   t.string "visibility"
  #   t.string "title"
  #   t.string "badge"
  #   t.bigint "user_id", null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["user_id"], name: "index_playlists_on_user_id"
  # end

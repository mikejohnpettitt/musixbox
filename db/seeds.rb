
UserSession.destroy_all
Question.destroy_all
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
  playlist_hiphop = [
  {playlist: playlist_hiphop, title: "Da Rockwilder", artist: "Method Man",                       youtube_url: "https://www.youtube.com/embed/WCYy8jpp7R8?si=ghxvwIgINGEowNdf" },
  {playlist: playlist_hiphop, title: "C.R.E.A.M.", artist: "Wu-Tang Clan",                        youtube_url: "https://www.youtube.com/embed/PBwAxmrE194?si=CFwzKKMS06eKM4xP" },
  {playlist: playlist_hiphop, title: "Time 4 Sum Aksion", artist: "Redman",                       youtube_url: "https://www.youtube.com/embed/FMUcfbpcIeg?si=QBPN6ffUDX4c7Atf" },
  {playlist: playlist_hiphop, title: "Woo Hah!! Got You All in Check", artist: "Busta Rhymes",    youtube_url: "https://www.youtube.com/embed/EQzvQO2LcA4?si=iSVsBGg9qmteFUmL" },
  {playlist: playlist_hiphop, title: "The World Is Yours", artist: "Nas",                         youtube_url: "https://www.youtube.com/embed/e5PnuIRnJW8?si=56P_93NqT_jvqtGn" },
  {playlist: playlist_hiphop, title: "Shook Ones Pt. II", artist: "Mobb Deep",                    youtube_url: "https://www.youtube.com/embed/yoYZf-lBF_U?si=Fx1wt-OCECG1fNuL" },
  {playlist: playlist_hiphop, title: "Mass Appeal", artist: "Gang Starr",                         youtube_url: "https://www.youtube.com/embed/y9lNbNGbo24?si=sZEV3gzYAT6OWYOf" },
  {playlist: playlist_hiphop, title: "Guess Who's Back", artist: "Rakim",                         youtube_url: "https://www.youtube.com/embed/c7ilAD54Lqo?si=eIckNIFIAZ1ueIQy" },
  {playlist: playlist_hiphop, title: "Nuthin’ But a “G” Thang", artist: "Dr. Dre",                youtube_url: "https://www.youtube.com/embed/8GliyDgAGQI?si=ZD4E67pGkGNOVJsr" },
  {playlist: playlist_hiphop, title: "Scenario", artist: "A Tribe Called Quest",                  youtube_url: "https://www.youtube.com/embed/Q6TLWqn82J4?si=K-ODEy-1RhoKi-BP" }
]
  ]
)
  Song.create!(
    [
playlist_blues = [
  {playlist: playlist_blues,title: "I'LL play the blues for you", artist:"daniel castro",          youtube_url: "https://www.youtube.com/embed/ioOzsi9aHQQ?si=xoq9jyEIJ7Slq36G"},
  {playlist: playlist_blues,title: "The sky is crying", artist:"gary B.B coleman",                 youtube_url: "https://www.youtube.com/embed/71Gt46aX9Z4?si=NyovdCyeJOYrgfPE"},
  {playlist: playlist_blues,title: "Make it rain", artist:"Foy Vance",                             youtube_url: "https://www.youtube.com/embed/hD5hIqeKNVE?si=I_HB2sXgVELPbVPo"},
  {playlist: playlist_blues,title: "Slightly hung over", artist:"Blues Delight",                   youtube_url: "https://www.youtube.com/embed/zq7hltwb_yc?si=qe7Q9GCwa_AJRcx4"},
  {playlist: playlist_blues,title: "At Last", artist:"Etta James",                                 youtube_url: "https://www.youtube.com/embed/S-cbOl96RFM?si=OazqA5aaivbbNti4"},
  {playlist: playlist_blues,title: "Everyday I have The Blues", artist:"B.B king ",                youtube_url: "https://www.youtube.com/embed/xtwUqXCQvAI?si=xN9nEIhY1E_2FLcp"},
  {playlist: playlist_blues,title: "Stay Around A little Longer", artist:"Buddy Guy",              youtube_url: "https://www.youtube.com/embed/emyt-agLE_s?si=l1_-4blKAOKAnqb3"},
  {playlist: playlist_blues,title: "My Babe", artist:"Little Walter",                              youtube_url: "https://www.youtube.com/embed/duRp_avXtMM?si=jzwEXmAXyevkIRA-"},
  {playlist: playlist_blues,title: "Going Down", artist:"Freddie King",                            youtube_url: "https://www.youtube.com/embed/V_ONyukSLqA?si=DS31uq-bt71SqFpd"},
  {playlist: playlist_blues,title: "Yes We Can Can", artist:"Allen Toussaint",                     youtube_url: "https://www.youtube.com/embed/xV7F-JwTx_U?si=yTU3A031r3albsJK"}
]
 ] )
 Song.create!(
  [
    playlist_rnb = [
      {playlist: playlist_rnb,title: "With You", artist: "Chris Brown",                     youtube_url:  "https://www.youtube.com/embed/nmjdaBaZe8Y?si=WcHRkDR9FNKbTlTI"},
      {playlist: playlist_rnb,title: "The Boy Is Mine", artist: "Brandy & Monica  ",        youtube_url:  "https://www.youtube.com/embed/qSIOp_K5GMw?si=Q4ilLCcuUnz1RyjQ"},
      {playlist: playlist_rnb,title: "Can We Talk", artist: "Tevin Campbell",               youtube_url:  "https://www.youtube.com/embed/3SoYkCAzMBk?si=S4EFE3gyxePvfhTZ"},
      {playlist: playlist_rnb,title: "Return Of The Mack", artist: "Mark Morrison",         youtube_url:  "https://www.youtube.com/embed/uB1D9wWxd2w?si=zjT9ZgCGYj4EhuOb"},
      {playlist: playlist_rnb,title: "This Is How We Do It", artist: "Montell Jordan",      youtube_url:  "https://www.youtube.com/embed/0hiUuL5uTKc?si=GF74j13X_0SggqRE"},
      {playlist: playlist_rnb,title: "Creep", artist: "TLC",                                youtube_url:  "https://www.youtube.com/embed/LlZydtG3xqI?si=F7D2Fif-sysazQN3"},
      {playlist: playlist_rnb,title: "Don't Walk Away", artist: "Jade",                     youtube_url:  "https://www.youtube.com/embed/wZ9HG0nGe-g?si=jh053M1Wbn9Fti3f"},
      {playlist: playlist_rnb,title: "Love Like This", artist: "Faith Evans",               youtube_url:  "https://www.youtube.com/embed/w1QzBQKYbag?si=svWcKCobhBwZiHnT"},
      {playlist: playlist_rnb,title: "I'm Dreaming", artist: "Christopher Williams",        youtube_url:  "https://www.youtube.com/embed/m51i4HbsI8k?si=axdd4zG3tX7KHBGb"},
      {playlist: playlist_rnb,title: "Romantic", artist: "Karyn White",                     youtube_url:  "https://www.youtube.com/embed/Mu-ty0dC9k4?si=ofxzT53zM7TJTnqo"}
  ]
]
 )
puts "success"

Song.create!(
  [
    {playlist: playlist_punk, title: "Basket Case",               artist: "Green Day",           youtube_url: "https://www.youtube.com/embed/NUTGr5t3MoY?si=1c7iinecHj4k_wGy"},
    {playlist: playlist_punk, title: "All the Small Things",      artist: "blink-182",           youtube_url: "https://www.youtube.com/embed/9Ht5RZpzPqw?si=pM9YxDOIr1j5IiV1"},
    {playlist: playlist_punk, title: "Self Esteem",               artist: "The Offspring",       youtube_url: "https://www.youtube.com/embed/EtNZnhxWLHo?si=tXrGv-rhndurQmIu"},
    {playlist: playlist_punk, title: "American Idiot",            artist: "Green Day",           youtube_url: "https://www.youtube.com/embed/Ee_uujKuJMI?si=o3vgBxdLnNxH2-4_"},
    {playlist: playlist_punk, title: "Stay together for the kids",artist: "blink-182",           youtube_url: "https://www.youtube.com/embed/k1BFHYtZlAU?si=o3kF0zGsNM_e6ppV"},
    {playlist: playlist_punk, title: "Linoleum",                  artist: "NOFX",                youtube_url: "https://www.youtube.com/embed/d9ORimXBXLw?si=Wl-ZU0UnNv3ow013"},
    {playlist: playlist_punk, title: "Time Bomb",                 artist: "Rancid",              youtube_url: "https://www.youtube.com/embed/LxaA9_mzOz4?si=Yb5ZDK3H9dxdB4E0"},
    {playlist: playlist_punk, title: "Anarchy in the U.K.",       artist: "Sex Pistols",         youtube_url: "https://www.youtube.com/embed/qbmWs6Jf5dc?si=2q6_4VtY4UsKxZAb"},
    {playlist: playlist_punk, title: "Blitzkrieg Bop",            artist: "Ramones",             youtube_url: "https://www.youtube.com/embed/NQDPx_k66w4?si=HsbkmnAR26-ax4sN"},
    {playlist: playlist_punk, title: "London Calling",            artist: "The Clash",           youtube_url: "https://www.youtube.com/embed/LC2WpBcdM_A?si=VO9dGZwWh_qrR2SJ"}
# FOR ROCK
  ]
)

Song.create!(
  [
    {playlist: playlist_rock, title: "Hardest Button to Button", artist: "The White Stripes",         youtube_url: "https://www.youtube.com/embed/K4dx42YzQCE?si=LbXTI9nJnt6mAj70"},
    {playlist: playlist_rock, title: "Seven Nation Army", artist: "The White Stripes",                youtube_url: "https://www.youtube.com/embed/0J2QdDbelmY?si=cFS5SG5JtqbZse3O"},
    {playlist: playlist_rock, title: "Everlong", artist: "Foo Fighters",                              youtube_url: "https://www.youtube.com/embed/eBG7P-K-r1Y?si=EwaR69_uN0hbRMIc"},
    {playlist: playlist_rock, title: "Californication", artist: "Red Hot Chili Peppers",              youtube_url: "https://www.youtube.com/embed/YlUKcNNmywk?si=JK-0O6fDy9Y7fkLX"},
    {playlist: playlist_rock, title: "No One Knows", artist: "Queens of the Stone Age",               youtube_url: "https://www.youtube.com/embed/s88r_q7oufE?si=40uEGndksGyop5IA"},
    {playlist: playlist_rock, title: "Reptilia", artist: "The Strokes",                               youtube_url: "https://www.youtube.com/embed/b8-tXG8KrWs?si=u4AVedkExLi7farf"},
    {playlist: playlist_rock, title: "Last Nite", artist: "The Strokes",                              youtube_url: "https://www.youtube.com/embed/TOypSnKFHrE?si=WmLByIoDWgipsm1g"},
    {playlist: playlist_rock, title: "Mr. Brightside", artist: "The Killers",                         youtube_url: "https://www.youtube.com/embed/gGdGFtwCNBE?si=Ad71l9gzdbPEto68"},
    {playlist: playlist_rock, title: "Welcome to the Jungle", artist: "Guns N' Roses",                youtube_url: "https://www.youtube.com/embed/o1tj2zJ2Wvg?si=-WrrgNynHFswUD2T"},
    {playlist: playlist_rock, title: "Smells Like Teen Spirit", artist: "Nirvana",                    youtube_url: "https://www.youtube.com/embed/hTWKbfoikeg?si=QYFN1ugCopuwOHOB"}
  ]
)
test = Song.where(playlist: playlist_punk)
puts "#{test.size} punk songs created"


puts "success"
# FOR JAZZ
Song.create!(
  [
    {playlist: playlist_jazz, title: "So What", artist: "Miles Davis",                                  youtube_url: "https://www.youtube.com/embed/zqNTltOGh5c?si=KYvGt2lMmXhHhDG9"},
    {playlist: playlist_jazz, title: "Take Five", artist: "The Dave Brubeck Quartet",                   youtube_url: "https://www.youtube.com/embed/vmDDOFXSgAs?si=KXl36pjlu79zkHaU"},
    {playlist: playlist_jazz, title: "My Favorite Things", artist: "John Coltrane",                     youtube_url: "https://www.youtube.com/embed/qWG2dsXV5HI?si=dXFSLqwP2hl3-yX5"},
    {playlist: playlist_jazz, title: "Blue in Green", artist: "Miles Davis",                            youtube_url: "https://www.youtube.com/embed/TLDflhhdPCg?si=5yNdriQuoj523eOw"},
    {playlist: playlist_jazz, title: "Strange Fruit", artist: "Billie Holiday",                         youtube_url: "https://www.youtube.com/embed/Lx_mOECjT_8?si=AQZXlWa_E7ND3Zc2"},
    {playlist: playlist_jazz, title: "A Night in Tunisia", artist: "Dizzy Gillespie",                   youtube_url: "https://www.youtube.com/embed/eQHpwnXf0mI?si=OLF9eJf5LukPoQd6"},
    {playlist: playlist_jazz, title: "Take the 'A' Train", artist: "Duke Ellington",                    youtube_url: "https://www.youtube.com/embed/cb2w2m1JmCY?si=haCzWjNlZMZiNlyc"},
    {playlist: playlist_jazz, title: "At Last", artist: "Etta James",                                   youtube_url: "https://www.youtube.com/embed/S-cbOl96RFM?si=7uzABf0aSh9jE3sg"},
    {playlist: playlist_jazz, title: "In a Sentimental Mood", artist: "Duke Ellington & John Coltrane", youtube_url: "https://www.youtube.com/embed/qDQpZT3GhDg?si=0PG3ex3QXOkQJBbO"},
    {playlist: playlist_jazz, title: "Feeling Good", artist: "Nina Simone",                             youtube_url: "https://www.youtube.com/embed/BNMKGYiJpvg?si=BRVx94A7PwL8T3-X"}
  ]
)
puts "success"


[
  {playlist: playlist_soul, title: "Respect", artist: "Aretha Franklin",                              youtube_url: "https://www.youtube.com/embed/6FOUqQt3Kg0?si=lWsZAjba8Gt1qUTT"},
  {playlist: playlist_soul, title: "What's Going On", artist: "Marvin Gaye",                          youtube_url: "https://www.youtube.com/embed/H-kA3UtBj4M?si=a6QDtlq48qKP3_mw"},
  {playlist: playlist_soul, title: "Stand By Me", artist: "Ben E. King",                              youtube_url: "https://www.youtube.com/embed/hwZNL7QVJjE?si=CEWcRBwONGjOH4dJ"},
  {playlist: playlist_soul, title: "My Girl", artist: "The Temptations",                              youtube_url: "https://www.youtube.com/embed/eepLY8J4E6c?si=YehHNlrcf4tkCtSO"},
  {playlist: playlist_soul, title: "When a Man Loves a Woman", artist: "Percy Sledge",                youtube_url: "https://www.youtube.com/embed/EYb84BDMbi0?si=hJf9JzRg9MWO40tD"},
  {playlist: playlist_soul, title: "Say It Loud - I'm Black and I'm Proud", artist: "James Brown",    youtube_url: "https://www.youtube.com/embed/4hj1iWqoYEc?si=foJsob97v1fj1-xZ"},
  {playlist: playlist_soul, title: "Sittin' On The Dock Of The Bay", artist: "Otis Redding",          youtube_url: "https://www.youtube.com/embed/rTVjnBo96Ug?si=8mItDiapSUAFywE3"},
  {playlist: playlist_soul, title: "Fallin'", artist: "Alicia Keys",                                  youtube_url: "https://www.youtube.com/embed/Urdlvw0SSEc?si=Qs6-dC9NKqIJ5hmn"},
  {playlist: playlist_soul, title: "The Thrill Is Gone", artist: "B.B. King",                         youtube_url: "https://www.youtube.com/embed/4fk2prKnYnI?si=phlwfzqE4I1bEF0g"},
  {playlist: playlist_soul, title: "(Sittin' On) The Dock of the Bay", artist: "Otis Redding",        youtube_url: "https://www.youtube.com/embed/rTVjnBo96Ug?si=z-BBGjidxwZCLQWd"}
]


[
  {playlist: playlist_funk, title: "Super Freak", artist: "Rick James",                               youtube_url: "https://www.youtube.com/embed/QYHxGBH6o4M?si=ADieEYlg6-UJp_6-"},
  {playlist: playlist_funk, title: "Give Up The Funk", artist: "Parliament",                          youtube_url: "https://www.youtube.com/embed/gBWH3OWfT2Y?si=T51v2T85T64mVby6"},
  {playlist: playlist_funk, title: "Brick House", artist: "Commodores",                               youtube_url: "https://www.youtube.com/embed/rrBx6mAWYPU?si=9tgk8sTNcYv6BDof"},
  {playlist: playlist_funk, title: "Play That Funky Music", artist: "Wild Cherry",                    youtube_url: "https://www.youtube.com/embed/QYHxGBH6o4M?si=jyw1VXUC36LHzGJ4"},
  {playlist: playlist_funk, title: "Get Up (I Feel Like Being a) Sex Machine", artist: "James Brown", youtube_url: "https://www.youtube.com/embed/sjzZh6-h9fM?si=t4OBYPmpIR11SdZ7"},
  {playlist: playlist_funk, title: "Flash Light", artist: "Parliament",                               youtube_url: "https://www.youtube.com/embed/bWurqD68u70?si=qzDMjalFtlZHMxNw"},
  {playlist: playlist_funk, title: "Jungle Boogie", artist: "Kool & The Gang",                        youtube_url: "https://www.youtube.com/embed/QGKiC2suCHQ?si=LrAiQiqP3TWEwXgE"},
  {playlist: playlist_funk, title: "Fire", artist: "Ohio Players",                                    youtube_url: "https://www.youtube.com/embed/zqsYNc_M988?si=szVC88ZLv_J1QAev"},
  {playlist: playlist_funk, title: "Love Rollercoaster", artist: "Ohio Players",                      youtube_url: "https://www.youtube.com/embed/JLzblwij078?si=CG9Ys9teAmKPA3fH"},
  {playlist: playlist_funk, title: "Get Down Saturday Night", artist: "Oliver Cheatham",              youtube_url: "https://www.youtube.com/embed/uUqcBwQjj4k?si=-sEdNrgduIL8gVHn"}
]

[
  {playlist: playlist_disco, title: "Stayin' Alive", artist: "Bee Gees",                        youtube_url: "https://www.youtube.com/embed/fNFzfwLM72c?si=jq5KcQ9iJzvu1QLz"},
  {playlist: playlist_disco, title: "Le Freak", artist: "Chic",                                 youtube_url: "https://www.youtube.com/embed/aXgSHL7efKg?si=mBzV953pzhyjZFGz"},
  {playlist: playlist_disco, title: "I Will Survive", artist: "Gloria Gaynor",                  youtube_url: "https://www.youtube.com/embed/6dYWe1c3OyU?si=W1dOXvGtyEWE8JY1"},
  {playlist: playlist_disco, title: "Dancing Queen", artist: "ABBA",                            youtube_url: "https://www.youtube.com/embed/xFrGuyw1V8s?si=wk2GtlbqxZj-e5HP"},
  {playlist: playlist_disco, title: "Don't Leave Me This Way", artist: "Thelma Houston",        youtube_url: "https://www.youtube.com/embed/8sAbzZjXLy8?si=TsWt2GM_B8-mdQ5w"},
  {playlist: playlist_disco, title: "Ma Baker", artist: "Boney M",                              youtube_url: "https://www.youtube.com/embed/9c5yPIQ3LQI?si=YK8SPIz3sgFI5uRX"},
  {playlist: playlist_disco, title: "Boogie Wonderland", artist: "Earth, Wind & Fire",          youtube_url: "https://www.youtube.com/embed/god7hAPv8f0?si=c30Gb5klTttNE5OY"},
  {playlist: playlist_disco, title: "He's the Greatest Dancer", artist: "Sister Sledge",        youtube_url: "https://www.youtube.com/embed/fLLSwHaYk6k?si=ThdtmaQuTslHzUDu"},
  {playlist: playlist_disco, title: "Hot Stuff", artist: "Donna Summer",                        youtube_url: "https://www.youtube.com/embed/KhcaPNuaJNU?si=ZEP8mgeYgbvsPkH7"},
  {playlist: playlist_disco, title: "Funky Town", artist: "Lipps Inc.",                         youtube_url: "https://www.youtube.com/embed/uhzy7JaU2Zc?si=eHukqeeIzaHLUc_Q"}
]
# FOR POP
Song.create!(
  [
    {playlist: playlist_pop, title: "Blinding Lights", artist: "The Weeknd",                    youtube_url: "https://www.youtube.com/embed/4NRXx6U8ABQ?si=fbsHNfeOrMla0TXq"},
    {playlist: playlist_pop, title: "Levitating", artist: "Dua Lipa",                           youtube_url: "https://www.youtube.com/embed/TUVcZfQe-Kw?si=oLX6tZJWDyeYDazb"},
    {playlist: playlist_pop, title: "Bad Guy", artist: "Billie Eilish",                         youtube_url: "https://www.youtube.com/embed/DyDfgMOUjCI?si=_E5HZbjjLD-f7vTk"},
    {playlist: playlist_pop, title: "As It Was", artist: "Harry Styles",                        youtube_url: "https://www.youtube.com/embed/H5v3kku4y6Q?si=FxoNVva29oXiy47r"},
    {playlist: playlist_pop, title: "Don’t Start Now", artist: "Dua Lipa",                      youtube_url: "https://www.youtube.com/embed/oygrmJFKYZY?si=KPrqY0qG-n3JqMgo"},
    {playlist: playlist_pop, title: "Shake It Off", artist: "Taylor Swift",                     youtube_url: "https://www.youtube.com/embed/Z4A9ZZo_rAE?si=zpiUFff_xJ3684--"},
    {playlist: playlist_pop, title: "Uptown Funk", artist: "Mark Ronson ft. Bruno Mars",        youtube_url: "https://www.youtube.com/embed/OPf0YbXqDm0?si=e7rOR7ufzNsQqo9f"},
    {playlist: playlist_pop, title: "Havana", artist: "Camila Cabello",                         youtube_url: "https://www.youtube.com/embed/BQ0mxQXmLsk?si=5PnkuDss1ZPx-aYe"},
    {playlist: playlist_pop, title: "Billie Jean", artist: "Michael Jackson",                   youtube_url: "https://www.youtube.com/embed/Zi_XLOBDo_Y?si=Qlhe0Efe9b-cBd7_"},
    {playlist: playlist_pop, title: "Royals", artist: "Lorde",                                  youtube_url: "https://www.youtube.com/embed/LFasFq4GJYM?si=UTjzs1kLNQne8ENu"}
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

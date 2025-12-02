class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.string :visibility
      t.string :title
      t.string :badge
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

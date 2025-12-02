class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

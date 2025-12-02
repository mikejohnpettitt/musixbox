class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.boolean :successful_title
      t.boolean :successful_artist
      t.integer :time_taken
      t.string :user_answer_title
      t.string :user_answer_artist
      t.references :session, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class AddColumnScoreToUserSessions < ActiveRecord::Migration[7.1]
  def change
      add_column :user_sessions, :score, :integer
  end
end

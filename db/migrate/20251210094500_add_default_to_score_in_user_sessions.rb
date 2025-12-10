class AddDefaultToScoreInUserSessions < ActiveRecord::Migration[7.1]
  def change
    change_column_default :user_sessions, :score, 0
  end
end

class ReplaceGroupIdWithUserIdInQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_reference :questions, :group, foreign_key: true
    add_reference :questions, :user, foreign_key: true
  end
end

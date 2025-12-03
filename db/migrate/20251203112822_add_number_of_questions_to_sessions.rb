class AddNumberOfQuestionsToSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :sessions, :number_of_questions, :integer, default: 5
  end
end

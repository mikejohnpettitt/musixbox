class MakeGroupIdNullabbleInQuestions < ActiveRecord::Migration[7.1]
  def change
    change_column_null :questions, :group_id, true
  end
end

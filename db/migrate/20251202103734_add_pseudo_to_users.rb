class AddPseudoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pseudo, :string
  end
end

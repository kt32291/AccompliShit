class AddStatsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :birthday, :date
  end
end

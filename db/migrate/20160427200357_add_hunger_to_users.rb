class AddHungerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_one, :decimal, :precision => 2, :scale => 1
    add_column :users, :one_counter, :integer
    add_column :users, :current_one, :float
    add_column :users, :total_one, :float
  end
end

class AddRespondToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_four, :decimal, :precision => 2, :scale => 1
    add_column :users, :four_counter, :integer
    add_column :users, :current_four, :float
    add_column :users, :total_four, :float
  end
end

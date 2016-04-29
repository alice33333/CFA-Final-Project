class AddExpectToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_two, :decimal, :precision => 2, :scale => 1
    add_column :users, :two_counter, :integer
    add_column :users, :current_two, :float
    add_column :users, :total_two, :float
  end
end

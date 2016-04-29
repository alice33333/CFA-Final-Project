class AddAcceptToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_three, :decimal, :precision => 2, :scale => 1
    add_column :users, :three_counter, :integer
    add_column :users, :current_three, :float
    add_column :users, :total_three, :float
  end
end

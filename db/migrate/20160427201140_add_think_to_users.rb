class AddThinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_five, :decimal, :precision => 2, :scale => 1
    add_column :users, :five_counter, :integer
    add_column :users, :current_five, :float
    add_column :users, :total_five, :float
  end
end

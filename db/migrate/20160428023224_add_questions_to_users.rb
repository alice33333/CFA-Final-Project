class AddQuestionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :extra_one, :decimal, :precision => 2, :scale => 1
    add_column :users, :extra_one_counter, :integer
    add_column :users, :current_extra_one, :float
    add_column :users, :total_extra_one, :float
  end
end

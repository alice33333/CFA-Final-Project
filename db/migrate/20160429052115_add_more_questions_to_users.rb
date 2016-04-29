class AddMoreQuestionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :extra_two, :decimal, :precision => 2, :scale => 1, default: 0.0
    add_column :users, :extra_two_counter, :integer
    add_column :users, :current_extra_two, :float
    add_column :users, :total_extra_two, :float
    
    add_column :users, :extra_three, :decimal, :precision => 2, :scale => 1, default: 0.0
    add_column :users, :extra_three_counter, :integer
    add_column :users, :current_extra_three, :float
    add_column :users, :total_extra_three, :float
    
    add_column :users, :extra_four, :decimal, :precision => 2, :scale => 1, default: 0.0
    add_column :users, :extra_four_counter, :integer
    add_column :users, :current_extra_four, :float
    add_column :users, :total_extra_four, :float
    
    add_column :users, :extra_five, :decimal, :precision => 2, :scale => 1, default: 0.0
    add_column :users, :extra_five_counter, :integer
    add_column :users, :current_extra_five, :float
    add_column :users, :total_extra_five, :float
  end
end

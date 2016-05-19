class AddResetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reset_one, :decimal, :precision => 2, :scale => 1, default: 0.0
    add_column :users, :reset_two, :decimal, :precision => 2, :scale => 1, default: 0.0
    add_column :users, :reset_three, :decimal, :precision => 2, :scale => 1, default: 0.0
  end
end

class AddTotalAverageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :overall, :decimal, :precision => 2, :scale => 1, default: 0.0
  end
end

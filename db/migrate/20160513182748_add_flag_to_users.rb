class AddFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :flag, :boolean, default: false
  end
end

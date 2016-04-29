class AddTiersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :leader, :boolean, default: false
    add_column :users, :manager, :boolean, default: false
  end
end

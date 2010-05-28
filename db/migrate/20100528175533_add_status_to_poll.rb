class AddStatusToPoll < ActiveRecord::Migration
  def self.up
    add_column :polls, :status, :integer, :default => 1
  end

  def self.down
    remove_column :polls, :status
  end
end

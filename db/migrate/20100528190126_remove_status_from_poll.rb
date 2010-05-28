class RemoveStatusFromPoll < ActiveRecord::Migration
  def self.up
    remove_column :polls, :status
    add_column :polls, :state, :string
  end

  def self.down
    add_column :polls, :status, :integer
    remove_column :polls, :state
  end
end

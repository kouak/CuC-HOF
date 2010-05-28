class RenamePollOptionIdToPollId < ActiveRecord::Migration
  def self.up
    rename_column :votes, :poll_option_id, :poll_id
    rename_column :votes, :voter_id, :user_id
  end

  def self.down
    rename_column :votes, :poll_id, :poll_option_id
    rename_column :votes, :user_id, :voter_id
  end
end

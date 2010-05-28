class AddOutfitIdToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :outfit_id, :integer
  end

  def self.down
    remove_column :votes, :outfit_id
  end
end

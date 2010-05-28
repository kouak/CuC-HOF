class RemovePollOptions < ActiveRecord::Migration
  def self.up
    add_column :outfits, :poll_id, :integer
    drop_table :poll_options
  end

  def self.down
    remove_column :outfits, :poll_id, :integer
    create_table :poll_options do |t|
      t.integer :poll_id
      t.integer :outfit_id

      t.timestamps
    end
  end
end

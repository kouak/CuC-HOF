class CreateOutfits < ActiveRecord::Migration
  def self.up
    create_table :outfits do |t|
      t.integer :user_id
      t.string :title
      t.string :member_name
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :outfits
  end
end

class AddIsActiveToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :is_active, :boolean
  end

  def self.down
    remove_column :albums, :is_active
  end
end

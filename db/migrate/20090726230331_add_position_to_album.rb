class AddPositionToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :position, :integer
  end

  def self.down
    remove_column :albums, :position
  end
end

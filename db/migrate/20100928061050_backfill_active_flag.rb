class BackfillActiveFlag < ActiveRecord::Migration
  def self.up
    execute "UPDATE albums SET is_active = 1"
  end

  def self.down
  end
end

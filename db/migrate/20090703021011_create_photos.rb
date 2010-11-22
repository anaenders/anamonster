class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.column :album_id,     :integer
      t.column :title,        :string
      t.column :description,  :text
      t.column :position,     :integer
      t.column :parent_id,    :integer
      t.column :content_type, :string
      t.column :filename,     :string    
      t.column :thumbnail,    :string 
      t.column :size,         :integer
      t.column :width,        :integer
      t.column :height,       :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end

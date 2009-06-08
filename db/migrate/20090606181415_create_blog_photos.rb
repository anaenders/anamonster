class CreateBlogPhotos < ActiveRecord::Migration
  def self.up
    create_table :blog_photos do |t|
      t.integer :blog_id
      
      # Attachment Fu Columns
      t.column :parent_id,    :integer
      t.column :content_type, :string
      t.column :filename,     :string    
      t.column :thumbnail,    :string 
      t.column :size,         :integer
      t.column :width,        :integer
      t.column :height,       :integer
      
      t.timestamps
    end
    
    add_index :blog_photos, :blog_id
  end

  def self.down
    drop_table :blog_photos
  end
end

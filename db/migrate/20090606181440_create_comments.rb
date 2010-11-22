class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :blog_id
      t.string :user_name
      t.string :email
      t.string :website_url      
      t.text :content
      t.timestamps
    end
    
    add_index :comments, :blog_id
  end

  def self.down
    drop_table :comments
  end
end

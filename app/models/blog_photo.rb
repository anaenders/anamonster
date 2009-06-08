# == Schema Information
# Schema version: 20090606181440
#
# Table name: blog_photos
#
#  id           :integer(4)      not null, primary key
#  blog_id      :integer(4)
#  parent_id    :integer(4)
#  content_type :string(255)
#  filename     :string(255)
#  thumbnail    :string(255)
#  size         :integer(4)
#  width        :integer(4)
#  height       :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class BlogPhoto < ActiveRecord::Base
  
  belongs_to :blog
  
  has_attachment(
    :content_type => :image, 
    :storage      => :file_system, 
    :max_size     => 10000.kilobytes,
    :resize_to    => '608>x456'
  )
  
  validates_as_attachment
  
end

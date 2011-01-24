# == Schema Information
# Schema version: 20110123210730
#
# Table name: blog_photos
#
#  id                 :integer(4)      not null, primary key
#  blog_id            :integer(4)
#  parent_id          :integer(4)
#  content_type       :string(255)
#  filename           :string(255)
#  thumbnail          :string(255)
#  size               :integer(4)
#  width              :integer(4)
#  height             :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#

class BlogPhoto < ActiveRecord::Base
  
  include AttachFuPhaseOut
  
  belongs_to :blog
  
  has_attached_file :image, :styles => {
    :main         => '250>x255>',
    :thumb        => '50x50#'
  }  
    
end

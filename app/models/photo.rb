# == Schema Information
# Schema version: 20110123210730
#
# Table name: photos
#
#  id                 :integer(4)      not null, primary key
#  album_id           :integer(4)
#  title              :string(255)
#  description        :text
#  position           :integer(4)
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

class Photo < ActiveRecord::Base
  
  include AttachFuPhaseOut
  
  belongs_to :album
  
  has_attached_file :image, :styles => {
    :main         => '640x480#',
    :thumb        => '50x50#',
    :gallery_hero => '160x30#'
  }  
  
  has_many :photo_exif_tags
  
  def is_cover_photo?
    album.cover == self
  end
  
  def tag(name)
    t = photo_exif_tags.select{|t| t.tag == name }.first
    t ? t.value : nil
  end
    
end

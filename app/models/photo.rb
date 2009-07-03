# == Schema Information
# Schema version: 20090501023904
#
# Table name: photos
#
#  id           :integer(4)      not null, primary key
#  album_id     :integer(4)
#  title        :string(255)
#  description  :text
#  position     :integer(4)
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

class Photo < ActiveRecord::Base
  
  belongs_to :album
  
  has_attachment(
    :content_type => :image, 
    :storage      => :file_system, 
    :max_size     => 10000.kilobytes,
    :resize_to    => '640>x480',
    :thumbnails   => {
      :thumb        => 'crop: 50x50',
      :gallery_hero => 'crop: 160x30'
    }
  )
  
  has_many :photo_exif_tags
  
  def is_cover_photo?
    album.cover == self
  end
  
  def thumb_url
    public_filename(:thumb)
  end

  def thumb_width
    Photo.first(:conditions => { :thumbnail => 'thumb', :parent_id => id }).width
  end
  
  def thumb_height
    Photo.first(:conditions => { :thumbnail => 'thumb', :parent_id => id }).height
  end
  
  def tag(name)
    t = photo_exif_tags.select{|t| t.tag == name }.first
    t ? t.value : nil
  end

  validates_as_attachment
  
  protected   
  def resize_image(img, size)
    if (size.is_a?(String) && size =~ /^crop: (\d*)x(\d*)/i) || (size.is_a?(Array) && size.first.is_a?(String) && size.first =~ /^crop: (\d*)x(\d*)/i)
      img.crop_resized!($1.to_i, $2.to_i)  
      self.temp_path = write_to_temp_file(img.to_blob)  
    else  
      super
    end
  end
  
end

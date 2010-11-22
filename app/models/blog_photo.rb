# == Schema Information
# Schema version: 20100928035415
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
    :resize_to    => '250>x255>',
    :thumbnails   => {
      :thumb        => 'crop: 50x50'
    }
  )
  
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

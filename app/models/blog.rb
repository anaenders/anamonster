# == Schema Information
# Schema version: 20090606181440
#
# Table name: blogs
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Blog < ActiveRecord::Base
  
  acts_as_taggable
  
  validates_presence_of :title, :content
  
  has_many :comments
  
  has_many :blog_photos, :dependent => :destroy
  after_save :save_attachments
  

  def photo_by_filename(filename)
    blog_photos.each do |blog_photo|
      return blog_photo if blog_photo.filename == filename
    end
    nil
  end
  
  def attachable=(params)
    @attachments = params.keys.sort.inject([]) { |vals, k| vals.push(params[k]) }.reject {|a| a[:uploaded_data].blank? }.collect { |a| BlogPhoto.new(a) }
  end
  
  def image_replaced_content
    content.gsub(/#\{img:\s*(.*)\s+(\S*)\}/) do |match|
      if !(photo = photo_by_filename($1))
        ''
      else
        "<p style = \"text-align: #{$2}\"><img src = \"#{photo.public_filename}\"  style = \"float: none\" /></p>"
      end
    end
  end
  
  protected  
  def save_attachments
    if @attachments
      @attachments.each do |attachment|
        blog_photos << attachment
      end
    end
  end
  
end

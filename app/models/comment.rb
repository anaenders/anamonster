# == Schema Information
# Schema version: 20100928035415
#
# Table name: comments
#
#  id          :integer(4)      not null, primary key
#  blog_id     :integer(4)
#  user_name   :string(255)
#  email       :string(255)
#  website_url :string(255)
#  content     :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base

  validates_presence_of :user_name, :content, :email
  validates_format_of :email, :with => Authentication.email_regex, :message => Authentication.bad_email_message, :if => Proc.new {|comment| !comment.email.blank? }

  belongs_to :blog
  
end

require 'rdiscount'

module ApplicationHelper

  include TagsHelper
  
  def set_current_section(section_name)
    @current_section = section_name
  end
  
  def get_current_section
    @current_section.to_s
  end

  def markdown(text)
    RDiscount.new(text).to_html
  end

end

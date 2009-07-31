module ApplicationHelper
  include TagsHelper
  
  def set_current_section(section_name)
    @current_section = section_name
  end
  
  def get_current_section
    @current_section.to_s
  end
  
end

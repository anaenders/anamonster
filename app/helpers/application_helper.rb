# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def set_current_section(section_name)
    @current_section = section_name
  end
  
  def get_current_section
    @current_section.to_s
  end
  
end

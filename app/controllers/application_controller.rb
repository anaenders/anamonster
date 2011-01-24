class ApplicationController < ActionController::Base

  helper :all

  protect_from_forgery

  def set_current_section(section_name)
    @current_section = section_name
  end
  
end
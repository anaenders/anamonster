class LinksController < ApplicationController

  before_filter :set_section

  def links
  end
  
  protected
  def set_section
    set_current_section(:links)
  end

end

class AboutController < ApplicationController

  before_filter :set_section
  
  protected
  def set_section
    set_current_section(:about)
  end

end

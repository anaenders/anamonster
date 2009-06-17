class AboutController < ApplicationController

  before_filter :set_section

  def about
  end
  
  protected
  def set_section
    set_current_section(:about)
  end

end

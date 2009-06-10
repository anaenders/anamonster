class ShowcaseController < ApplicationController

  before_filter :set_section

  def showcase
  end
  
  protected
  def set_section
    set_current_section(:showcase)
  end


end

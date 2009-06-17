class ContactController < ApplicationController

  before_filter :set_section
  
  def contact
  end
  
  protected
  def set_section
    set_current_section(:contact)
  end

end

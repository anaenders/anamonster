class GalleryController < ApplicationController

  before_filter :set_section

  def index
  end

  protected
  def set_section
    set_current_section(:gallery)
  end

end

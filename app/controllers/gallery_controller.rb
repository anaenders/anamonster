class GalleryController < ApplicationController

  before_filter :set_section

  def index
    @albums = Album.all(:order => 'position DESC', :conditions => { :is_active => true })
    logger.debug(@albums.inspect)
  end
  
  def album
    render :partial => 'album', :object => Album.find(params[:id])
  end

  protected
  def set_section
    set_current_section(:gallery)
  end

end
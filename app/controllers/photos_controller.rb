class PhotosController < ApplicationController
  
  before_filter :login_required
  before_filter :load_photo, :only => [ :edit, :update, :destroy ]
  
  def new; @photo = Photo.new; end
  def edit; end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = 'Photo was successfully created.'
      redirect_to(photos_url)
    else
      render :action => "index"
    end
  end

  def update
    render :update do |page|
      if @photo.update_attributes(params[:photo])
        page.show :update_success
        page.hide :update_failure
      else
        page.show :update_failure
        page.hide :update_success
      end
    end
  end

  def destroy
    @album = @photo.album
    @photo.destroy
    redirect_to(edit_album_path(@album))
  end
  
  protected
  def load_photo
    @photo = Photo.find(params[:id])    
  end
end
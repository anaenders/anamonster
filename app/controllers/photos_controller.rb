class PhotosController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :load_photo, :only => [ :edit, :update, :destroy ]
  
  def new; @photo = Photo.new; end
  def edit; end

  def create
    if (@photo = Photo.new(params[:photo])).save
      render :partial => 'albums/photo', :object => @photo
    else
      render :text => @photo.errors.full_messages.join('<br />'), :status => 400
    end
  end

  def update
    render :update do |page|
      if @photo.update_attributes(params[:photo])
        render :nothing => true
      else
        render :nothing => true, :status => '400'
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
class AlbumsController < ApplicationController
  
  before_filter :login_required
  before_filter :load_album, :only => [ :edit, :update, :destroy ]
  
  def new
    @album = Album.new
  end
  
  def new_photo_field
    render :partial => 'photo_fields', :locals => { :num => params[:num] }
  end

  def edit; end

  def create
    @album = Album.new(params[:album])
    if @album.save
      flash[:notice] = 'Album was successfully created.'
      redirect_to(:controller => 'gallery', :action => 'index')
    else
      render :action => "new"
    end
  end

  def update
    # Name is updated via AJAX.  The rest is updated via regular post
    if params[:album][:name]
      render :update do |page|
        if @album.update_attributes(params[:album])
          page.show :update_success
          page.hide :update_failure
        else
          page.show :update_failure
          page.hide :update_success
        end
      end
      return
    end
    
    if @album.update_attributes(params[:album])
      flash[:notice] = 'Album was successfully updated.'
      redirect_to(edit_album_url(@album))
    else
      render :action => "index"
    end
  end

  def destroy
    @album.destroy
    redirect_to(:controller => 'gallery', :action => 'index')
  end
  
  protected
  def load_album
    @album = Album.find(params[:id])
  end
end

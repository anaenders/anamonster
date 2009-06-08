class BlogPhotosController < ApplicationController
  
  before_filter :login_required
  before_filter :load_blog_photo, :only => [ :edit, :update, :destroy ]
  
  def new; @blog_photo = BlogPhoto.new; end
  def edit; end

  def create
    @blog_photo = BlogPhoto.new(params[:blog_photo])
    if @blog_photo.save
      flash[:notice] = 'Blog Photo was successfully created.'
      redirect_to(blog_photos_url)
    else
      render :action => "index"
    end
  end

  def update
    render :update do |page|
      if @blog_photo.update_attributes(params[:blog_photo])
        page.show :update_success
        page.hide :update_failure
      else
        page.show :update_failure
        page.hide :update_success
      end
    end
  end

  def destroy
    @blog = @blog_photo.blog
    @blog_photo.destroy
    redirect_to(blog_path(@blog))
  end
  
  protected
  def load_blog_photo
    @blog_photo = BlogPhoto.find(params[:id])    
  end
  
end
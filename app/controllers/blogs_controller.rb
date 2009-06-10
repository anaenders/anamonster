class BlogsController < ApplicationController

  before_filter :set_section
  before_filter :load_blog, :only => [ :show, :edit, :update, :destroy ]

  def index
    @blogs = Blog.all
  end
  
  def show; end
  def edit; end
  def new; @blog = Blog.new; end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      flash[:notice] = 'Blog was successfully created.'
      redirect_to(@blog)
    else
      render :action => "new"
    end
  end

  def update
    if @blog.update_attributes(params[:blog])
      flash[:notice] = 'Blog was successfully updated.'
      redirect_to(@blog)
    else
      render :action => "edit"
    end
  end

  def destroy
    @blog.destroy
    redirect_to(blogs_url)
  end
  
  # For AJAX which creates new form fields.
  def new_photo_field
    render :partial => 'blog_photo_fields', :locals => { :num => params[:num] }
  end
  
  protected
  def load_blog
    @blog = Blog.find(params[:id])
  end
  
  def set_section
    set_current_section(:blog)
  end
  
end

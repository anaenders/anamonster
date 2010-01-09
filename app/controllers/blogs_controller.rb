class BlogsController < ApplicationController

  before_filter :load_search_photo_thumbs
  before_filter :set_section
  before_filter :load_blog, :only => [ :show, :edit, :update, :destroy ]
  before_filter :login_required, :only => [ :edit, :new, :create, :update, :destroy ]
  before_filter :load_calendar, :only => [ :index, :show ]
  before_filter :load_twitter_client

  def index
    @blogs = Blog.paginate(:per_page => 2, :page => params[:page] || 1, :order => 'created_at DESC')
  end
  
  def show; end
  def edit; end
  def new; @blog = Blog.new; end

  def feed
    @blogs = Blog.all(:order => 'created_at DESC', :limit => 5)
    render :layout => false
  end

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
  
  def search
    @by = params[:by]
    @value = params[:value]
    @blogs = case @by
     when 'tag': Blog.find_tagged_with(@value)
     when 'keyword': Blog.all(:conditions => [ 'LOWER(title) LIKE ? OR LOWER(content) LIKE ?', "%#{@value}%", "%#{@value}%"] )
     when 'date': Blog.for_day(params[:year].to_i, params[:month].to_i, params[:day].to_i)
     else []
    end
    
    if @blogs.size == 1
      @blog = @blogs.first
      load_calendar
      render :action => :show and return
    end
    
    load_calendar
  end
  
  # For AJAX which creates new form fields.
  def new_photo_field
    render :partial => 'blog_photo_fields', :locals => { :num => params[:num] }
  end
  
  def post_comment
    rel = params[:comment][:blog_id]
    @comment = Comment.new(params[:comment])
    captcha_valid = verify_recaptcha
    if captcha_valid && @comment.save
      Mailer.deliver_comment(@comment)
      render :update do |page|
        page.insert_html(
          :before, "new_blog_drop_#{rel}",
          :partial => 'comment',
          :object  => @comment,
          :locals  => { :visible => true }
        )
        page.replace_html("comment_count_#{rel}", @comment.blog.comments.size)
        page.replace_html("comment_errors_#{rel}", '')
        page << "$('.comment[rel=\"#{rel}\"]').show();"
        page << "$('.textfield_wrapper[rel=\"#{rel}\"] .reply_content').val('');"
        page << "Recaptcha.reload();"
      end
    else
      if !captcha_valid
        render :update do |page|
          page.replace_html("comment_errors_#{rel}", 'Your captcha response does not match, please try again')
          page << "Recaptcha.reload();"
        end        
      else
        render :update do |page|
          page.replace_html("comment_errors_#{rel}", @comment.errors.full_messages.join('<br />'))
          page << "Recaptcha.reload();"
        end
      end
    end
  end
  
  def delete_comment
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :update do |page|
      page.remove "comment_#{params[:id]}"
    end
  end
  
  protected
  def load_blog
    @blog = Blog.find(params[:id])
  end
  
  def set_section
    set_current_section(:blog)
  end
  
  def load_search_photo_thumbs
    @blog_search_thumbs = BlogPhoto.all(:conditions => { :parent_id => nil }, :order => 'created_at DESC', :limit => 8)
  end

  
  def load_calendar
    @year  = params[:yr] ? params[:yr].to_i : (@blog ? @blog.created_at.year  : Date.today.year)
    @month = params[:mo] ? params[:mo].to_i : (@blog ? @blog.created_at.month : Date.today.month)
    @previous = { :year => @month == 1  ? @year - 1 : @year, :month => @month == 1  ? 12 : @month - 1 }
    @next     = { :year => @month == 12 ? @year + 1 : @year, :month => @month == 12 ? 1  : @month + 1 }
    
    @selected_days = Blog.for_month(@year, @month).collect { |b| b.created_at.mday }.uniq
  end
  
end

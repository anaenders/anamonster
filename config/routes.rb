ActionController::Routing::Routes.draw do |map|

  # Blog
  map.resources :blogs
  map.resources :blog_photos
  map.blog_new_photo_field '/blog/new_photo_field', :controller => 'blogs', :action => 'new_photo_field'
  map.blog_calendar_day '/blogs/search/:by/:year/:month/:day', :controller => 'blogs', :action => 'search'
  map.blog_search '/blogs/search/:by', :controller => 'blogs', :action => 'search'
  map.post_comment '/blogs/post_comment', :controller => 'blogs', :action => 'post_comment'
  map.delete_comment '/blogs/delete_comment/:id', :controller => 'blogs', :action => 'delete_comment'
  
  # RSS
  map.blog_rss '/feed.xml', :controller => 'blogs', :action => 'feed'
  
  # Login
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.resource :session
  
  # Contact
  map.contact '/contact', :controller => 'contact', :action => 'index'
  
  # About
  map.link_category '/about/category/:category', :controller => 'about', :action => 'index'
  map.resources :about
  
  # Sessions
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users
  map.resource :session
  
  # Showcase
  map.resources :showcase
  
  # Gallery
  map.gallery '/gallery', :controller => 'gallery'
  map.gallery_album '/gallery/album/:id', :controller => 'gallery', :action => 'album'
  map.gallery_album '/gallery/photo/:id', :controller => 'gallery', :action => 'photo'
  map.resources :albums, :collection => 'list_albums' # For admin only
  map.new_photo_field '/albums/new_photo_field', :controller => 'albums', :action => 'new_photo_field'
  map.resources :photos # For admin only

  # Default
  map.root :controller => 'blogs'

end

ActionController::Routing::Routes.draw do |map|

  # Blog
  map.resources :blogs
  map.resources :blog_photos
  map.blog_new_photo_field '/blog/new_photo_field', :controller => 'blogs', :action => 'new_photo_field'


  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'

  map.resource :session

  map.root :controller => 'blogs'

  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end

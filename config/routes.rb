Anamonster::Application.routes.draw do

  devise_for :users

  resources :blogs
  resources :blog_photos

  match '/blog/new_photo_field' => 'blogs#new_photo_field', :as => :blog_new_photo_field
  match '/blogs/search/:by/:year/:month/:day' => 'blogs#search', :as => :blog_calendar_day
  match '/blogs/search/:by' => 'blogs#search', :as => :blog_search
  match '/blogs/post_comment' => 'blogs#post_comment', :as => :post_comment
  match '/blogs/delete_comment/:id' => 'blogs#delete_comment', :as => :delete_comment

  match '/feed.xml' => 'blogs#feed', :as => :blog_rss

  match '/contact' => 'contact#index', :as => :contact
  match '/about/category/:category' => 'about#index', :as => :link_category

  resources :about
  resources :showcase

  match '/gallery' => 'gallery#index', :as => :gallery
  match '/gallery/album/:id' => 'gallery#album', :as => :gallery_album
  match '/gallery/photo/:id' => 'gallery#photo', :as => :gallery_album

  resources :albums do
    collection do
      get :list_albums
    end
  end

  resources :photos

  match '/admin/update_field' => 'admin#update_field'
  
  root :to => 'blogs#index'
  
end
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

ENV['RECAPTCHA_PUBLIC_KEY']  = "6Lf7bAkAAAAAAN1cKNqfQbtGzfkGOzsEkoopPqVI"
ENV['RECAPTCHA_PRIVATE_KEY'] = "6Lf7bAkAAAAAACuVQcYqezrCWu1BqxFj8wRdBTQK"

Rails::Initializer.run do |config|
  
  begin
    require 'rdiscount'
    BlueCloth = RDiscount
  rescue LoadError
    require 'bluecloth'
  end
  
  config.gem 'twitter' , :version => '>=0.9.2'
  
  config.time_zone = 'Eastern Time (US & Canada)'

  config.action_controller.session = {
    :session_key => '_anamonster_session',
    :secret      => '63ed143bd8c4b43187fae6b94a9a257ba0011f7fc68234c561abf5750b8d9d03fb3dbcd66491aa22bd2d33fcb865aa145379a44ea906bfbb2293c1a7a1f00261'
  }

end
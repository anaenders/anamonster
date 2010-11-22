set :application,            'anamonster'
set :user,                   'root'
set :runner,                 user
set :scm,                    :git
set :repository,             'git@github.com:anacarter/anamonster.git'
set :branch,                 'master'
set :git_enable_submodules,  1
set :keep_releases,          3
set :deploy_to,              "/var/www/#{application}"
set :deploy_via,             :remote_cache
set :source_profile,         ''
set :use_sudo,               false

role :web, '67.23.26.253'
role :app, '67.23.26.253'
role :db,  '67.23.26.253', :primary => true

namespace :deploy do
  task :after_update_code do
    link_up_assets
    link_twitter_config
    cleanup
  end

  task :restart do
    sudo 'apache2ctl restart'
  end
  
  desc "Symlink in CMS upload directories to the current release"
  task :link_up_assets do
    %w{link_photos photos plug_photos blog_photos}.each do |dir|
      run <<-CMD
      mkdir -p #{shared_path}/#{dir} &&
      rm -rf #{release_path}/public/#{dir} && 
      ln -nfs #{shared_path}/#{dir} #{release_path}/public/#{dir}
      CMD
    end
    
    run "mkdir -p #{release_path}/tmp/attachment_fu"
    run "chmod 777 #{release_path}/tmp/attachment_fu"
  end
  
  task :link_twitter_config do
    run "ln -nfs #{shared_path}/config/twitter.yml #{release_path}/config/twitter.yml"
  end
end


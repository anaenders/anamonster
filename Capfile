load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

ssh_options[:keys] = %w(~/.ssh/id_dsa)

ssh_options[:paranoid] = false
default_run_options[:pty] = true
# cap -S rails_version=5991 deploy
set :rails_version, 'HEAD' unless variables[:rails_version]
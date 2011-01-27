set :application, "5palabritas"
set :repository,  "git@github.com:fabbed/palabritas.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_verbose, true
set :git_shallow_clone, "1"
set :deploy_via, :remote_cache

set :use_sudo, false
set :deploy_to, "/var/www/rails/www.5palabritas.com"
set :default_run_options, :pty => true

set :user, "rails"


role :web, "83.169.47.164"                          # Your HTTP server, Apache/etc
role :app, "83.169.47.164"                          # This may be the same as your `Web` server
role :db,  "83.169.47.164", :primary => true # This is where Rails migrations will run



# =============================================================================
# SSH OPTIONS
# =============================================================================
# ssh_options[:keys] = %w(/path/to/my/key /path/to/another/key)
# ssh_options[:port] = 25
ssh_options[:forward_agent] = true


#after "deploy:update_code", "deploy:remove_rvmrc"
after "deploy:symlink", "deploy:copy_configs_from_shared"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  task :remove_rvmrc do
    run "rm -fr #{release_path}/.rvmrc"
  end
  
  task :copy_configs_from_shared do
    %w(database.yml).each do |file|
      run "ln -nfs #{shared_path}/config/#{file} #{release_path}/config/#{file}"
    end
  end
  
end

# have builder check and install gems after each update_code
require 'bundler/capistrano'
set :bundle_without, [:development, :test, :metrics, :deployment]


$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"
set :rvm_ruby_string, 'ree@5palabritas'
set :rvm_type, :user

set :default_environment, {
  'PATH' => "/home/rails/.rvm/gems/ree-1.8.7-2010.02/bin:/home/rails/.rvm/bin:/home/rails/.rvm/rubies/ree-1.8.7-2010.02/bin:$PATH",
  'RUBY_VERSION' => 'ree',
  'GEM_HOME'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02',
  'GEM_PATH'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02'
}
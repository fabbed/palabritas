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

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

# have builder check and install gems after each update_code
require 'bundler/capistrano'
set :bundle_without, [:development, :test, :metrics, :deployment]
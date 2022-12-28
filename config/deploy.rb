# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"
server '3.217.135.81', user: 'deploy', roles: %w{app db web}

set :application, 'clecostore'
set :pty, true
set :repo_url, "git@github.com:aayumalviya/cleco_store_api.git"
# Default branch is :master
#ask :branch, git rev-parse --abbrev-ref HEAD.chomp
set :branch, ENV['BRANCH'] || "main"

# Default deploy_to directory is /var/www/my_app_name

set :user, "deploy"

append :linked_dirs, '.bundle' # added after rails 6

# set :puma_threads,    [4, 16]
# set :puma_workers,    0

# Don't change these unless you know what you're doing
set :use_sudo,        false
set :production,      :production
set :deploy_via,      :remote_cache

set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, 'ruby-3.0.1'      # Defaults to: 'default'

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, false  # Change to true if using ActiveRecord

set :linked_files, %w{config/master.key}
set :linked_dirs, %w{log tmp/pids tmp/cache public/uploads}

# set :linked_files, %w{config/production.key}

set :keep_releases, 6

# Default branch is :master
# ask :branch, git rev-parse --abbrev-ref HEAD.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# namespace :deploy do
#
#   desc 'Restart application'
#   task :restart do
#     # restart via puma
#   end
#
#
# end

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

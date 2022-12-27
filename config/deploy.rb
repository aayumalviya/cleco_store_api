# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"
server "3.217.135.81", user: "deploy", roles: %w{app db web}

set :application, 'cleco_store'
set :pty, false
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
set :rvm_ruby_version, 'ruby-3.0.0'      # Defaults to: 'default'
set :default_env, { rvm_bin_path: "~/.rvm/bin" }

set :deploy_to, '/home/deploy/apps/clecostore'
# set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
# set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
# set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
# set :puma_access_log, "#{release_path}/log/puma.error.log"
# set :puma_error_log,  "#{release_path}/log/puma.access.log"
# # set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
# set :puma_preload_app, true
# set :puma_worker_timeout, nil
# set :puma_init_active_record, false  # Change to true if using ActiveRecord

set :linked_files, %w{config/database.yml config/sidekiq.yml config/production.key config/master.key}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

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

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { git config user.name.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:
server '3.217.135.81', user: 'ubuntu', roles: %w{app db web}, my_property: :my_value
server '3.217.135.81', user: 'ubuntu', roles: %w{app web}, other_property: :other_value
server '3.217.135.81', user: 'ubuntu', roles: %w{db}
# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.
# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
server '3.217.135.81',
       user: 'ubuntu',
       roles: %w{web app},
       ssh_options: {
           user: 'ubuntu', # overrides user setting above
           keys: %w(~/.ssh/id_rsa),
           forward_agent: true,
           auth_methods: %w(publickey)
           # password: 'please use keys'
       }
set :branch, 'main'
set :rails_env, "production"
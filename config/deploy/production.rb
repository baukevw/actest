server '104.248.198.193', user: 'deploy', roles: %w(web app db)

set :deploy_to, '/var/www/actest/production'

set :rails_env, 'production'
set :branch, 'master'

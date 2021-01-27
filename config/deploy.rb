# config valid for current version and patch releases of Capistrano
lock "~> 3.15.0"

set :application, 'invoiced-app'
set :repo_url, 'git@github.com:baukevw/actest.git'

set :rvm_ruby_version, '3.0.0'
set :passenger_restart_with_touch, true
set :pty, true

append :linked_files, '.env', 'config/master.key'
append :linked_dirs, 'log', 'tmp', 'public/system', 'public/uploads', 'storage'

namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key"
        end
      end
    end
  end
end

lock "~> 3.11.0"
require 'capistrano-db-tasks'

set :application, 'btd-blog'
set :repo_url, 'git@github.com:braintrust-digital/btd-blog.git'
set :deploy_via, :remote_cache
set :deploy_to, '/home/deploy/btd-blog'

set :keep_releases, 2
set :keep_assets, 2

set :db_local_clean, true
set :db_remote_clean, true

append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end

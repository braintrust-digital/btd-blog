lock "~> 3.11.0"

set :application, 'HexCom'
set :repo_url, "git@github.com:HexArmor/HexCom.git"
set :deploy_via, :remote_cache
set :deploy_to, '/home/deploy/hexcom'

set :keep_releases, 2
set :keep_assets, 2

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

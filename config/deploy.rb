lock "~> 3.17.1"

set :application, "grillmeal"
set :repo_url, "git@github.com:dasmodal/bbq.git"
set :branch, 'add_capistrano'
set :deploy_to, "/home/deploy/www/#{fetch :application}"

set :log_level, :info

append :linked_files, "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

namespace :deploy do

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  after :finishing, "deploy:cleanup"

end

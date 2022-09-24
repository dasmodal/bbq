require "capistrano/setup"
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/rbenv"
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require "capistrano/passenger"

set :rbenv_type, :user
set :rbenv_ruby, "3.1.2"

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
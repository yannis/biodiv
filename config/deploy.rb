# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'biodiv'
set :repo_url, 'git@github.com:yannis/biodiv.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_files, fetch(:linked_files, []).push('config/application.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.2.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /usr/local/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# Default value for keep_releases is 5
set :keep_releases, 5
server '129.194.57.242', user: 'yannis', roles: %w{web app db}


task :staging do
  set :branch, "development"
  set :stage, 'staging'
end


task :production do
  set :branch, "master"
  set :stage, 'production'
end

set :rails_env, fetch(:stage)
set :application, "biodiv_#{fetch(:stage)}"
set :deploy_to, "/Users/yannis/railsapps/#{fetch(:application)}"
set :eye_unicorn_config, "#{fetch(:deploy_to)}/current/config/unicorn_#{fetch(:stage)}.eye"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

namespace :deploy do

  task :start do
    on roles(:app) do
      execute "/usr/local/bin/eye start #{fetch(:application)}"
    end
  end

  task :stop do
    on roles(:app) do
      execute "/usr/local/bin/eye stop #{fetch(:application)}"
    end
  end

  task :restart do
    on roles(:app) do
      execute "/usr/local/bin/eye stop #{fetch(:application)}"
      execute "/usr/local/bin/eye l #{fetch(:eye_unicorn_config)}"
      execute "/usr/local/bin/eye start #{fetch(:application)}"
      # execute "/usr/local/bin/eye restart #{fetch(:application)}"
    end
  end

  desc "Start or reload eye config"
  task :load_eye do
    on roles(:app) do
      execute "/usr/local/bin/eye l #{fetch(:eye_unicorn_config)}"
    end
  end

end

before "deploy:restart", "deploy:load_eye"
after "deploy:cleanup", "deploy:restart"
after "deploy:restart", "airbrake:deploy"

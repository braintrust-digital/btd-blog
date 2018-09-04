server '34.201.128.1', user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'

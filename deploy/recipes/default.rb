deploy 'api laravel' do
  repo 'https://github.com/salvianoo/angular-node-seed.git'
  user 'www-data'
  group 'www-data'
  deploy_to '/var/www/api'
  action :deploy
end

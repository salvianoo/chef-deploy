directory '/var/www/api' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

deploy_revision '/var/www/api' do
  symlink_before_migrate.clear
  create_dirs_before_symlink.clear
  purge_before_symlink.clear
  symlinks.clear
end

deploy 'api laravel' do
  repo 'https://github.com/salvianoo/angular-node-seed.git'
  user 'www-data'
  group 'www-data'
  deploy_to '/var/www/api'
  action :deploy
end

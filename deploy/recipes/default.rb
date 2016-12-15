directory '/var/www/api' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

deploy_revision "/var/www/api" do
  repo 'https://github.com/salvianoo/angular-node-seed.git'
  user 'ubuntu'
  keep_releases 10
  action :deploy
  migrate false
  symlink_before_migrate.clear
  create_dirs_before_symlink
  purge_before_symlink.clear
  symlinks.clear
  symlinks {}
end

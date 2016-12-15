directory '/var/www/api' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

ruby_block 'Printing variables' do
  block do
    application = params[:app]
    deploy = params[:deploy_data]

    Chef::Log.debug("salviano Application data: #{application}")
    Chef::Log.debug("salviano Deploy data: #{deploy}")
  end
  action :run
end

# deploy_revision "/var/www/api" do
#   repo node['deploy']['api_fretes']['scm']['repository']
#   user 'www-data'
#   keep_releases 10
#   action :deploy
#   migrate false
#   symlink_before_migrate.clear
#   create_dirs_before_symlink
#   purge_before_symlink.clear
#   symlinks.clear
#   symlinks {}
# end

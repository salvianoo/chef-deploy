directory '/var/www/api' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

# ruby_block 'Printing variables' do
#   block do
#     application = params[:app]
#     deploy = params[:deploy_data]
#     puts "salviano Application data: #{application}"
#     puts "salviano Deploy data: #{deploy}"
#   end
#   action :run
# end

node[:deploy].each do |application, deploy|
  deploy = node[:deploy][application]
  puts "salviano ---- #{deploy}"

  deploy_revision "/var/www/api" do
    repo node["deploy"]["appshortname"]["scm"]["repository"]
    user 'www-data'
    keep_releases 5
    action :deploy
    migrate false
    symlink_before_migrate.clear
    create_dirs_before_symlink
    purge_before_symlink.clear
    symlinks.clear
    symlinks {}
  end

end

node[:deploy].each do |application, deploy|

  opsworks_deploy do
    deploy_data '/var/www/api_laravel'
    app 'salvianoo'
  end

end

# directory '/var/www/api' do
#   owner 'www-data'
#   group 'www-data'
#   mode '0755'
#   action :create
# end

# template "/tmp/.ssh/chef_ssh_deploy_wrapper.sh" do
#   source "chef_ssh_deploy_wrapper.sh.erb"
#   owner node[:base][:username]
#   mode 0770
# end

# template "/home/#{node[:base][:username]}/.ssh/id_rsa.pub" do
#   source "id_rsa.pub.erb"
#   owner node[:base][:username]
#   mode 0600
# end

# template "/home/#{node[:base][:username]}/.ssh/id_rsa" do
#   source "id_rsa.erb"
#   owner node[:base][:username]
#   mode 0600
# end

# ruby_block 'Printing variables' do
#   block do
#     application = params[:app]
#     deploy = params[:deploy_data]
#     puts "salviano Application data: #{application}"
#     puts "salviano Deploy data: #{deploy}"
#   end
#   action :run
# end

# node[:deploy].each do |application, deploy|
#   deploy = node[:deploy][application]

#   puts "salviano ---- #{deploy}"

#   deploy_revision "/var/www/api" do
#     repo deploy["scm"]["repository"]
#     user 'www-data'
#     keep_releases 5
#     action :deploy
#     migrate false
#     ssh_wrapper deploy["scm"]["ssh_key"]
#     symlink_before_migrate.clear
#     create_dirs_before_symlink
#     purge_before_symlink.clear
#     symlinks.clear
#     symlinks {}
#   end

# end

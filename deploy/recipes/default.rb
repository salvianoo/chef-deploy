include_recipe 'dependencies'

node[:deploy].each do |application, deploy|

  opsworks_deploy_user do
    deploy_data deploy
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end
  
  doc_root = "#{deploy[:deploy_to]}/current"
  
  template "#{doc_root}/.env" do
    source 'env.erb'
    mode '0660'
    owner 'deploy'
    group 'www-data'
    variables(
      :env => deploy[:environment_variables]
    )
  end
  
  [ 
    "#{doc_root}/storage",
    "#{doc_root}/storage/app",
    "#{doc_root}/storage/app/public",
    "#{doc_root}/storage/framework",
    "#{doc_root}/storage/framework/cache",
    "#{doc_root}/storage/framework/sessions",
    "#{doc_root}/storage/framework/views",
    "#{doc_root}/storage/logs",
    "#{doc_root}/bootstrap/cache",
  ].each do |folder_name|
    directory folder_name do
      mode '0755'
      owner 'deploy'
      group 'www-data'
    end
  end
  
end

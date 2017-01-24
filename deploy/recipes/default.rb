include_recipe 'dependencies'

node[:deploy].each do |application, deploy|

  opsworks_deploy_user do
    deploy_data deploy
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end

  template "#{deploy[:deploy_to]}/current/.env" do
    source 'env.erb'
    mode '0660'
    owner 'deploy'
    group 'www-data'
    variables(
      :env => deploy[:environment_variables]
    )
  end

end

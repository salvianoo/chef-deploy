include_recipe 'dependencies'

node[:deploy].each do |application, deploy|

  opsworks_deploy_user do
    deploy_data deploy
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end

end

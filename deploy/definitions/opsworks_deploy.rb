define :opsworks_deploy do
  application = params[:app]
  deploy      = params[:deploy_data]

  puts "--------- DEBUGGGG!!! ----------"
  puts application, deploy
end

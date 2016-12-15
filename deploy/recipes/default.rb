# deploy 'private_repo' do
#   repo 'git@github.com:acctname/private-repo.git'
#   user 'ubuntu'
#   deploy_to '/tmp/private_code'
#   ssh_wrapper '/tmp/private_code/wrap-ssh4git.sh'
#   action :deploy
# end

node['deploy']['appshortname']

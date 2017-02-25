# Build gobuster
#execute 'go get' do
#  cwd '/opt/sources/gobuster'
#  creates '/opt/sources/gobuster/src'
#  environment(
#    'GOPATH' => '/opt/sources/gobuster/'
#  )
#end
#
#execute 'go build' do
#  cwd '/opt/sources/gobuster'
#  creates '/opt/sources/gobuster/gobuster'
#  environment(
#    'GOPATH' => '/opt/sources/gobuster/'
#  )
#end
#
#execute 'sudo cp gobuster /usr/bin/gobuster' do
#  cwd '/opt/sources/gobuster/'
#  creates '/usr/bin/gobuster'
#end

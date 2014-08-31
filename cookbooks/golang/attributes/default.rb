default['go']['version'] = '1.3'
default['go']['platform'] = 'amd64'
default['go']['filename'] = "go#{node['go']['version']}.#{node['os']}-#{node['go']['platform']}.tar.gz"
default['go']['url'] = "https://storage.googleapis.com/golang/#{node['go']['filename']}"
default['go']['install_dir'] = '/usr/local'
default['go']['gopath'] = '/opt/go'
default['go']['gobin'] = '/opt/go/bin'
default['go']['scm'] = true
default['go']['packages'] = []
default['go']['owner'] = 'root'
default['go']['group'] = 'root'

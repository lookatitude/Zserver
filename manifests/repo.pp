define zserver::repo (
  $version = 'UNSET') {
  
  # notify {"Version in repo: ${version}":}
  
  include apt
  
  # set repo URLs based on version
  $repo = "http://repos.zend.com/zend-server/${version}/deb"
  $repo_ssl = "${repo}_ssl1.0"

  # add repo and key 
  apt::source { 'zendserverrepo':
    include_src => false,
    location    => $repo,
    release     => 'server',
    repos       => 'non-free',
    key         => 'F7D2C623',
    key_server  => 'http://repos.zend.com/zend.key',
  }

  # add ssl repo and key
  apt::source { 'zendserverrepossl':
    include_src => false,
    location    => $repo_ssl,
    release     => 'server',
    repos       => 'non-free',
    key         => 'F7D2C623',
    key_server  => 'http://repos.zend.com/zend.key',
  }
#  exec { "apt-get update": }

}
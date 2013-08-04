
class zserver::install (
  $version           = '',
  $php_version       = '',
  $nginx             = '',
  $community_edition = '',
  $install_path      = $zserver::params::install_path,
  $default_vhost     = $zserver::params::default_vhost,
  ) {
	  
	  include zserver::params
	  
	  if $version == '' {
	    $version = $zserver::params::version
	  }
	  
	  if $php_version == '' {
	    $php_version = $zserver::params::php_version  
	  }
	  
	  if $ngnix == '' {
	    $ngnix = $zserver::params::nginx
	    
	    }
	  if $community_edition == '' {
	    $community_edition = $zserver::params::ce
	  
	  }
	  if $install_path == '' {
	    $install_path = $zserver::params::install_path
	    
	  }
	  if $default_vhost == '' {
	    $default_vhost  = $zserver::params::default_vhost
	  }
	  
	  notify {"variables":
	    message => "Version: ${version} \n  php_version: $php_version \n nginx: $nginx \n ce: $community_edition  \n install_path: $install_path  \n default_vhost: $default_vhost  \n ",
	  }
	   
	
	  #########################
	  # set repositories
	  #########################
	
	  zserver::repo { 'repo':
	    version   => $version,
	    # subscribe => Notify['variables'],
	  }
	
	  ############################
	  # set Package and install
	  ############################
	
	  zserver::package { 'package':
	    version     => $version,
	    php_version => $php_version,
	    nginx       => $nginx,
	    ce          => $community_edition,
	    # subscribe   => Zendserver::Repo['repo'],
	  }
	
	  # #########################
	  #  Set configuration
	  ###########################
	
	  class { 'config':
	    install_path  => $install_path,
	    default_vhost => $default_vhost,
	    # subscribe     => Zendserver::Package['package'],
	  }
	
	  Notify['variables']->Zserver::Repo['repo']->Zserver::Package['package']->Class['config']
}
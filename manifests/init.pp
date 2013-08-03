# Class: zserver
#
# This module manages zendserver
#
# Parameters: version
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage: Class {'zendserver': }
#
class zserver (
  $version        = '',
  $php_version    = '',
  $nginx          = '',
  $ce             = '',
  $install_path   = '',
  $default_vhost  = '',

){
  include zendserver::params
  
  if $version == '' {
    $version = $zendserver::params::version
  }
  
  if $php_version == '' {
    $php_version = $zendserver::params::php_version  
  }
  
  if $nginx == '' {
    $nginx = $zendserver::params::nginx
    
    }
  if $ce == '' {
    $ce = $zendserver::params::ce
  
  }
  if $install_path == '' {
    $install_path = $zendserver::params::install_path
    
  }
  if $default_vhost == '' {
    $default_vhost  = $zendserver::params::default_vhost
  }
  
  notify {"variables":
    message => "Version: ${version} \n  php_version: $php_version \n nginx: $nginx \n ce: $ce  \n install_path: $install_path  \n default_vhost: $default_vhost  \n ",
  }

  #########################
  # set repositories
  #########################

  zendserver::repo { 'repo':
    version   => $version,
    # subscribe => Notify['variables'],
  }

  ############################
  # set Package and install
  ############################

  zendserver::package { 'package':
    version     => $version,
    php_version => $php_version,
    nginx       => $nginx,
    ce          => $ce,
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

  Notify['variables']->Zendserver::Repo['repo']->Zendserver::Package['package']->Class['config']
  # restart zend-server service
  # zendserver::service 
}

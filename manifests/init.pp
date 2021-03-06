# Class: zserver
#
# This module manages zendserver
#
# Parameters: 0.1.0-dev
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
  $admin_password = '',
  $devPassword    = '',
  $orderNumber    = '',
  $licenseKey     = '',
  $acceptEula     = "",
  $appUrl         = '',
  $production     = "" ){
  include zserver::params
    
    $int_version = $version ? {
      '' => $zserver::params::version,
      default => $version
    }
    
    $int_php_version = $php_version ? {
      '' => $zserver::params::php_version,
      default => $php_version 
    }
    
    $int_nginx = $nginx ? {
      '' => $zserver::params::nginx,
      default => $nginx
      
      }
    $int_community_edition = $ce ? {
      '' => $zserver::params::ce, 
      default => $ce
    }
    $int_install_path = $install_path ? {
      '' => $zserver::params::install_path, 
      default => $install_path
    }
    $int_default_vhost = $default_vhost ? {
        '' => $zserver::params::default_vhost,
        default => $default_vhost
    }
    $int_admin_password = $admin_password ? {
        '' => $zserver::params::admin_password,
        default => $admin_password
    }
    
    $int_devPassword = $devPassword ? {
        '' => $zserver::params::devPassword,
        default => $devPassword
    }
    
    $int_orderNumber = $orderNumber ? {
        '' => $zserver::params::orderNumber,
        default => $orderNumber
    }
    $int_licenseKey = $licenseKey ? {
        '' => $zserver::params::licenseKey,
        default => $licenseKey
    }
    $int_acceptEula = $acceptEula ? {
        '' => $zserver::params::acceptEula,
        default => $acceptEula
    }
    $int_appUrl = $appUrl ? {
        '' => $zserver::params::appUrl,
        default => $appUrl 
    }
    $int_production = $production ? {
        '' => $zserver::params::production,
        default => $production
    }
    
#    notify {"variables":
#      message => "Version: ${int_version} \n php_version: ${int_php_version} \n nginx: ${int_nginx} \n ce: ${int_community_edition}  \n install_path: ${int_install_path}  \n default_vhost: ${int_default_vhost}  \n ",
#    }
     
  
    #########################
    # set repositories
    #########################
  
    zserver::repo { 'repo':
      version   => $int_version,
      # subscribe => Notify['variables'],
    }
  
    ############################
    # set Package and install
    ############################
  
    zserver::package { 'package':
      version     => $int_version,
      php_version => $int_php_version,
      nginx       => $int_nginx,
      ce          => $int_community_edition,
      # subscribe   => Zendserver::Repo['repo'],
    }
  
    # #########################
    #  Set configuration
    ###########################
  
    class { 'config':
      install_path  => $int_install_path,
      default_vhost => $int_default_vhost,
      adminPassword => $int_admin_password,
		  devPassword    => $int_devPassword,
		  orderNumber    => $int_orderNumber,
		  licenseKey     => $int_licenseKey,
		  acceptEula     => $int_acceptEula,
		  appUrl         => $int_appUrl,
		  production     => $int_production, 
      # subscribe     => Zendserver::Package['package'],
    }
  
    Zserver::Repo['repo']->Zserver::Package['package']->Class['config']
  # restart zend-server service
  # zendserver::service 
}

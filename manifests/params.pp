class zserver::params {

  # PHP version to be used
  $php_version = "5.4"
  # Zend Server version to be used
  $version = "6.1"
  # Set up nginx boolean
  $nginx = true
  # Install Zend Server community edition (ce)
  $ce = false
  # zend server install path
  $install_path = "/usr/local/zend"

  # default Vhost path
  $default_vhost = "${install_path}/etc/sites.d/zend-default-vhost-80.conf"
}
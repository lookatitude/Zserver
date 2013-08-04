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
  # admin password
  $admin_password = "vagrant"
  # developer password
  $devPassword = ''
  # Zend Server Order Number
  $orderNumber = ''
  # Zend Server Licence Key
  $licenseKey = ''
  # Accept EULA must be true
  $acceptEula = "TRUE"
  # default App URL defailt: empty
  $appUrl = ''
  # set configuration envoirment to production
  $production = "TRUE"
}
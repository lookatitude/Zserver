define zserver::package (
	$version ,
	$php_version,
 	$nginx,
 	$ce ){

	case $nginx {
		true: {
			$zend_package = "zend-server-nginx-php-${php_version}"
		}
		default: {
			if $ce == false {
				$zend_package = "zend-server-php-${php_version}"
			} else {
				$zend_package = "zend-server-ce-php-${php_version}"
			}
		} 
	}

	notify{"Package name: ${zend_package}":}
	
	package { 'zendserver':
		name => $zend_package,
		ensure => 'latest',

	}
	
	

}
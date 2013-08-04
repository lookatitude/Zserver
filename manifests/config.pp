class config (
	$install_path,
	$default_vhost,
	$adminPassword,
	$devPassword,
	$orderNumber,
	$licenseKey,
	$acceptEula,
	$appUrl,
	$production ) {
  
  $order = $orderNumber ? {
    '' => '',
    default => "--orderNumber ${orderNumber} --licenseKey ${licenseKey} "
  }
  
	file_line { "profile":
		path => '/etc/profile',
		line => "PATH=\$PATH:${install_path}/bin \n LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:${install_path}/lib",

	}

	file_line { "defaultvhost":
		path => "${default_vhost}",
		#match => "root *$",
		line => "root /usr/share/nginx/html;",
    ensure => absent,
	}
	
	exec { "zserverconfig":
    command => "/usr/local/zend/bin/zs-manage bootstrap-single-server --adminPassword ${adminPassword} --devPassword ${devPassword} ${order}--acceptEula ${acceptEula} --appUrl ${appUrl} --production ${production}",
  }
  
	File_Line['profile']->File_Line['defaultvhost']->Exec['zserverconfig']

}
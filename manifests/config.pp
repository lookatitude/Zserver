class config (
	$install_path,
	$default_vhost
	) {

	file_line { "profile":
		path => '/etc/profile',
		line => "PATH=\$PATH:${install_path}/bin \n LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:${install_path}/lib",

	}

	# file_line { "defaultvhost":
	#	path => "${default_vhost}",
	#	match => "/^*root *$/",
	#	line => "# root /usr/share/nginx/html;",

	#}

}
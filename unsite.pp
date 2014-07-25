# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}



class empty {

	package { 'eclipse':
		ensure=>'purged',
	}

	package { 'maven':
		ensure=>'purged',
	}

	package { 'oracle-java7-installer':
		ensure=>'purged',
	}

	# include java7
	# ensure => "purged"


}



node default {
 	include empty 
}
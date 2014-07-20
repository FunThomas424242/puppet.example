# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}


class { 'eclipse':
  release_name    => 'kepler',
  service_release => 'SR2',
}

eclipse::plugin { 'egit':
  method => 'p2_director',
  iu     => 'org.eclipse.egit.feature.group',
}


node default {
	include java7
	include git
	include maven
	include eclipse 
	include dropbox
	notice('Well done!')
}
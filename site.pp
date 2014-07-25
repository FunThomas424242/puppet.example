# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}


class { 'eclipse':
  #method          => 'download',
  release_name    => 'kepler',
  service_release => 'SR1',
}

eclipse::plugin { 'egit':
  method => 'p2_director',
  iu     => 'org.eclipse.egit.feature.group',
}


vcsrepo { ant:
        path     => "/srv/ant",
        source   => "https://github.com/maestrodev/puppet-ant.git",
#        revision => "v0.8.3.4",
        provider => "git",
        ensure   => present,
    }


node default {
	include java7
	include git
	include maven
	include eclipse 
	include dropbox
	notice('Well done!')
}
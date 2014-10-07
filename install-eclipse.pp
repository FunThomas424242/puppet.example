# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}


class  { 'eclipse':
  method          => 'download',
  release_name    => 'kepler',
  service_release => 'SR2',
  ensure => present,
}


eclipse::plugin { 'm2e':
  method     => 'p2_director',
  iu         => 'org.eclipse.m2e.feature.feature.group',
  repository => 'http://download.eclipse.org/releases/kepler'
}


#vcsrepo { ant:
#        path     => "/srv/ant",
#        source   => "https://github.com/maestrodev/puppet-ant.git",
#        revision => "v0.8.3.4",
#        provider => "git",
#        ensure   => present,
#    }


node default {
	include eclipse 
#	notice('Well done!')
}
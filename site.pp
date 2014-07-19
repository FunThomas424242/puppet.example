# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}

# puppetlabs-apt
exec { "apt-modul":
    command => "sudo puppet module install --force puppetlabs-apt",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

# git 
exec { "git-modul":
    command => "sudo puppet module install --force puppetlabs-git",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

# java 
exec { "java-modul":
    command => "sudo puppet module install --force softek-java7",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

# maven 
exec { "maven-modul":
    command => "sudo puppet module install --force maestrodev-maven",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

$repo = {
  id       => "myrepo",
  username => "myuser",
  password => "mypassword",
  url      => "http://repo.acme.com",
  mirrorof => "external:*" # if you want to use the repo as a mirror, see maven::settings below
}

#class { "maven:maven":
 # version => "3.0.4",
 # repo    => $repo
#}



# eclipse 
exec { "eclipse-modul":
    command => "sudo puppet module install --force mjanser-eclipse",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

class { 'eclipse':
  release_name    => 'kepler',
  service_release => 'SR1',
}

eclipse::plugin { 'egit':
  method => 'p2_director',
  iu     => 'org.eclipse.egit.feature.group',
}

# bitcoin 
exec { "bitcoin-paketl":
    command => "sudo apt-get bitcoin install",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

node default {
	include java7
	include git
	#include maven
 	include eclipse 
	notice('Well done!')
}
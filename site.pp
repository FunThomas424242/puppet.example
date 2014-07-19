# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
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

# eclipse 
exec { "eclipse-modul":
    command => "sudo puppet module install --force mjanser-eclipse",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}




node default {
	include java7
	include git
 	include eclipse 
	notice('Well done!')
}
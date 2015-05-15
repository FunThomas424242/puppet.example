# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}

#
# puppetlabs
#

# stdlib
exec { "stdlib-modul":
    command => "sudo puppet module install --force puppetlabs-stdlib",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}



# neillturner 
exec { "java-neillturner":
    command => "sudo puppet module uninstall neillturner-oraclejava",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

# oscerd 
exec { "java-oscerd":
    command => "sudo puppet module uninstall oscerd-java",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

# 7terminals 
exec { "java-7terminals":
    command => "sudo puppet module uninstall 7terminals-java",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}


# puppetlabs 
exec { "java-modul":
    command => "sudo puppet module uninstall  puppetlabs-java",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}
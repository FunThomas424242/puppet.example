# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}

# gini-archive
#exec { "gini-archive-modul":
#    command => "sudo puppet module install --force gini-archive",
#    path    => "/usr/local/bin/:/bin/:/usr/bin",
#}

#
# puppetlabs
#

# stdlib
exec { "stdlib-modul":
    command => "sudo puppet module install --force puppetlabs-stdlib",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}



# java 
exec { "java-neillturner":
    command => "sudo puppet module install --force neillturner-oraclejava",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

## java 
#exec { "java-oscerd":
#    command => "sudo puppet module uninstall --force oscerd-java",
#    path    => "/usr/local/bin/:/bin/:/usr/bin",
#}
#
## java 
#exec { "java-7terminals":
#    command => "sudo puppet module uninstall --force 7terminals-java",
#    path    => "/usr/local/bin/:/bin/:/usr/bin",
#}
#
#
## java 
#exec { "java-modul":
#    command => "sudo puppet module uninstall --force puppetlabs-java",
#    path    => "/usr/local/bin/:/bin/:/usr/bin",
#}
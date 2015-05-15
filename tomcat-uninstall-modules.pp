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



# puppetlabs 
exec { "puppetlabs-tomcat":
    command => "sudo puppet module uninstall puppetlabs-tomcat",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

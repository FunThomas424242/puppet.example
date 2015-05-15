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

# concat
exec { "concat-modul":
    command => "sudo puppet module install --force puppetlabs-concat",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

# nanliu/staging
exec { "staging-modul":
    command => "sudo puppet module install --force nanliu/staging",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}


# tomcat 
exec { "puppetlabs-tomcat":
    command => "sudo puppet module install --force puppetlabs-tomcat",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

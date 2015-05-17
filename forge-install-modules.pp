# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}


# stdlib
exec { "stdlib-modul":
    command => "sudo puppet module install --force puppetlabs-stdlib",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}



# counsyl-sys  
exec { "counsyl-sys":
    command => "sudo puppet module install --force counsyl-sys",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}


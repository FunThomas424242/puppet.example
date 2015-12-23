# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}

# gini-idea
exec { "gini-idea-modul":
    command => "sudo puppet module install --force gini-idea",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}


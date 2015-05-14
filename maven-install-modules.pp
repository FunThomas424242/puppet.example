# wget 
exec { "masestrodev-wget-modul":
    command => "sudo puppet module install --force maestrodev-wget",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

# maven 
exec { "maven-modul":
    command => "sudo puppet module install --force maestrodev-maven",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

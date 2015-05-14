
# stdlib 
exec { "stdlib":
    command => "sudo puppet module install --force maestrodev-wget",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}


# maven Maestrodev
exec { "maven-maestrodev":
    command => "sudo puppet module install --force maestrodev-maven",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}


# maven BoxUpp
exec { "maven-boxupp":
    command => "sudo puppet module uninstall BoxUpp-apache_maven",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

# maven UniBet
exec { "maven-unibet":
    command => "sudo puppet module uninstall unibet-maven",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}


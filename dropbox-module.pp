

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

# dropbox
exec { "stdlib-modul":
    command => "sudo puppet module install --force rcoleman-dropbox",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}


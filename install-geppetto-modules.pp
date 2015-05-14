#
# funthomas424242
#

# eclipse 
exec { "gepetto-modul":
    command => "sudo puppet module install --force funthomas424242-geppetto",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

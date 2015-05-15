Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

node default {
  notice('Uninstall not supported by puppet module.')
} 
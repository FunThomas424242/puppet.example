Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class { 'idea::ultimate':
  version => '15.0.2',
}



node default {
  include archive::prerequisites
  #include idea
}
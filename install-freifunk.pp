

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }


# build-essential
class system-update {

  exec { 'apt-get update':
    command => 'apt-get update -y',
  }

  $sysPackages = [ "build-essential" ]
  package { $sysPackages:
    ensure => "latest",
    require => Exec['apt-get update'],
  }
}

include system-update

class freifunk::params {
  case $::osfamily {
    "Debian": {
      case $::lsbdistcodename {
        "wheezy": {
        }
        "trusty": {
        }
      default: { fail("unsupported release ${::lsbdistcodename}") }
      }
    }
    default: { fail("unsupported platform ${::osfamily}") }
  }
}


class freifunk inherits freifunk::params {
	
	$libsToInstall = ["zlib1g-dev", "lua5.2", "unzip", "libncurses-dev", "gawk", "git", "subversion"]
	  package { $libsToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	$packagesToPurge = ["gnumeric", "rutilt", "etherape", "gnome-mplayer", "nautilus-dropbox",  "sylpheed","transmission-gtk","transmission-remote-gtk","transmission-qt","transgui", "abiword"]
	  package { $packagesToPurge:
	    ensure => "absent",
	    require => Exec['apt-get update']
	 }


}


node default {
	include freifunk
}
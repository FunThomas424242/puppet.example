
#class wuala {
#
#	apt::source { 'voria':
#	  location   => 'http://repos.wuala.com',
#	  repos      => 'main',
#	 # key        => '4BD6EC30',
#	  #key_server => 'pgp.mit.edu',
#	}
#
#	#apt::ppa { 'ppa:voria/ppa': }
#
#	package{"wuala":
#		ensure=>installed
#	}
#}

class grundsystem::params {
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


class grundsystem inherits grundsystem::params {
  package { "alsa-base":
    ensure => installed
  }
  package { "alsa-utils":
    ensure => installed
  }
  package { "libasound2-plugin-equal":
    ensure => installed
  }
 package { "qasconfig":
    ensure => installed
  }
 package { "alsaplayer":
    ensure => installed
  }
  package { "vlc":
    ensure => installed
  }
  package { "padevchooser":
    ensure => installed
  }

 package { "fglrx":
    ensure => installed
  }

 package {"p7zip-full":
	ensure=>installed
 }

package {"xbmc":
	ensure=>installed
 }

}



node default {
	include grundsystem
	#include wuala
}
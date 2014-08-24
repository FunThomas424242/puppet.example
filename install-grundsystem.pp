
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

package {"librarian-puppet":
	ensure=>installed
 }

package {"hplip-gui":
	ensure=>installed
 }

package {"emacs24":
	ensure=>installed
 }

package {"gimp":
	ensure=>installed
 }

package {"blender":
	ensure=>installed
 }

package {"gramps":
	ensure=>installed
 }

package {"calibre":
	ensure=>installed
 }

package {"libreoffice-base":
	ensure=>installed
 }

package {"libreoffice-calc":
	ensure=>installed
 }

package {"libreoffice-draw":
	ensure=>installed
 }

package {"libreoffice-impress":
	ensure=>installed
 }

package {"libreoffice-math":
	ensure=>installed
 }

package {"libreoffice-writer":
	ensure=>installed
 }


package {"electrum":
	ensure=>installed
 }

package {"nautilus-dropbox":
	ensure=>absent
# wird über modul installiert
 }

package {"eclipse-platform":
	ensure=>absent
 }

}



node default {
	include grundsystem
	#include wuala
}

#class wuala {
#
#	apt::source { 'voria':
#	  location   => 'http://repos.wuala.com',
 #         release =>'trusty',
#	  repos      => 'main',
#	 # key        => '4BD6EC30',
#	  #key_server => 'pgp.mit.edu',
#	}
#
#	apt::ppa { 'ppa:voria/ppa': }
#
#	package{"wuala":
#		ensure=>installed
#	}
#}

#class wuala-install {
#
#	apt::source { 'super-os':
#	  location   => 'http://www.ubuntuupdates.org/super-os',
#	  #repos      => 'main',
#	 # key        => '4BD6EC30',
#	  #key_server => 'pgp.mit.edu',
#	}
#
#	apt::ppa { 'ppa:super-os/ppa': }
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
  
	
	$libsToInstall = ["hplip-gui","librarian-puppet","xbmc", "qasconfig" ,"libasound2-plugin-equal","alsa-base"]
	  package { $libsToInstall:
	    ensure => "installed",
	    #require => Exec['apt-get update']
	  }
	
	$tools = ["p7zip-full", "fglrx","padevchooser"]
	  package { $tools:
	    ensure => "installed",
	    #require => Exec['apt-get update']
	  }
	
	
	$officePackages = ["libreoffice","libreoffice-base","libreoffice-l10n-de","libreoffice-draw","libreoffice-calc","libreoffice-writer", "libreoffice-math", "libreoffice-impress" ]
	  package { $officePackages:
	    ensure => "installed",
	    #require => Exec['apt-get update']
	  }
	
	
	 $packagesToInstall = [ "vlc", "electrum","calibre","gramps","blender","gimp","emacs24","alsaplayer", "alsa-utils"]
	  package { $packagesToInstall:
	    ensure => "installed",
	    #require => Exec['apt-get update']
	  }
	
	
	$packagesToPurge = [ "nautilus-dropbox", "eclipse-platform" ]
	  package { $packagesToPurge:
	    ensure => "absent",
	    #require => Exec['apt-get update']
	 }


}


node default {
	#include wuala
	include grundsystem
}

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

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

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
  
	
	$libsToInstall = ["hplip-gui","librarian-puppet","xbmc", "qasconfig" ,"libasound2-plugin-equal","alsa-base","software-properties-gtk"]
	  package { $libsToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	$tools = ["p7zip-full", "fglrx","padevchooser"]
	  package { $tools:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	$officePackages = ["libreoffice","libreoffice-base","libreoffice-l10n-de","libreoffice-draw","libreoffice-calc","libreoffice-writer", "libreoffice-math", "libreoffice-impress" ]
	  package { $officePackages:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	 $packagesToInstall = [ "eclipse-platform", "simple-scan", "evolution","vlc", "electrum","calibre","gramps","blender","gimp","firefox","emacs24","alsaplayer", "alsa-utils","flush"]
	  package { $packagesToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	$packagesToPurge = [ "nautilus-dropbox", "sylpheed","transmission-gtk","transmission-remote-gtk","transmission-qt","transgui"]
	  package { $packagesToPurge:
	    ensure => "absent",
	    require => Exec['apt-get update']
	 }


}


node default {
	#include wuala
	include grundsystem
}
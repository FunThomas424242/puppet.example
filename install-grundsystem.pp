
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
  
	
	$libsToInstall = ["hplip-gui","librarian-puppet","puppet", "xbmc", "qasconfig" ,"libasound2-plugin-equal","alsa-base","software-properties-gtk", "aptitude"]
	  package { $libsToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	$tools = ["p7zip", "fglrx", "padevchooser"]
	  package { $tools:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	$officePackages = ["libreoffice","libreoffice-base","libreoffice-l10n-de","libreoffice-draw","libreoffice-calc","libreoffice-writer", "libreoffice-math", "libreoffice-impress" ]
	  package { $officePackages:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	 $packagesToInstall = [ "eclipse-platform", "giggle", "jabref", "kiki", "freemind", "spim", "simple-scan", "evolution", "keepass2", "vlc", "electrum","calibre","gramps","blender","gimp","firefox","emacs24","alsaplayer", "alsa-utils","flush", "gpa"]
	  package { $packagesToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
         $gamesToInstall = [ "fltk1.1-games", "cgoban", "gnubg", "lincity-ng" ]
	  package { $gamesToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }

	
	$packagesToPurge = [ "nautilus-dropbox",  "sylpheed","transmission-gtk","transmission-remote-gtk","transmission-qt","transgui", "abiword"]
	  package { $packagesToPurge:
	    ensure => "absent",
	    require => Exec['apt-get update']
	 }


}


node default {
	include grundsystem
}
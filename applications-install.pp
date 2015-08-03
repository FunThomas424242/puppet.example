

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

class applications::params {
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


class applications inherits applications::params {
	
	 $packagesToInstall = [ "dropbox", "blogilo","eclipse-platform", "gradle", "giggle", "jabref", "kiki", "freemind", "spim", "simple-scan", "evolution", "keepass2", "vlc", "electrum","calibre","gramps","blender","gimp","firefox","emacs24","alsaplayer", "alsa-utils","flush", "gpa"]
	  package { $packagesToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }

	$officePackages = ["libreoffice","libreoffice-base","libreoffice-l10n-de","libreoffice-draw","libreoffice-calc","libreoffice-writer", "libreoffice-math", "libreoffice-impress" ]
	  package { $officePackages:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }

	$toolsToInstall = [ "npm","node","gparted","shutter","kazam","filezilla","meld","yacy"]
	  package { $toolsToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	

	
	$gamesToInstall = [ "fltk1.1-games", "cgoban", "gnubg", "lincity-ng" ]
	  package { $gamesToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	$packagesToPurge = ["recorditnow","ksnapshot","gnumeric", "rutilt", "etherape", "gnome-mplayer", "sylpheed","transmission-gtk","transmission-remote-gtk","transmission-qt","transgui", "abiword","mc"]
	  package { $packagesToPurge:
	    ensure => "absent",
	    require => Exec['apt-get update']
	 }


}


node default {
	include applications
}
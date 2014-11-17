

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
	
	$tools = ["p7zip", "fglrx", "padevchooser", "torchat", "gns3", "xscreensaver", "ksnapshot"]
	  package { $tools:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	$officePackages = ["libreoffice","libreoffice-base","libreoffice-l10n-de","libreoffice-draw","libreoffice-calc","libreoffice-writer", "libreoffice-math", "libreoffice-impress" ]
	  package { $officePackages:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	 $packagesToInstall = [ "blogilo","eclipse-platform", "giggle", "jabref", "kiki", "freemind", "spim", "simple-scan", "evolution", "keepass2", "vlc", "electrum","calibre","gramps","blender","gimp","firefox","emacs24","alsaplayer", "alsa-utils","flush", "gpa","dropbox", "nautilus-dropbox"]
	  package { $packagesToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	$packagesToPurge = ["gnumeric", "rutilt", "etherape", "gnome-mplayer", "sylpheed","transmission-gtk","transmission-remote-gtk","transmission-qt","transgui", "abiword"]
	  package { $packagesToPurge:
	    ensure => "absent",
	    require => Exec['apt-get update']
	 }


}


node default {
	include grundsystem
}
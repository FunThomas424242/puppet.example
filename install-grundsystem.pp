

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
  
	
	$libsToInstall = ["network-manager","network-manager-gnome","librarian-puppet","puppet", "qasconfig" ,"libasound2-plugin-equal","alsa-base","software-properties-gtk", "aptitude"]
	  package { $libsToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	$tools = ["kwalletmanager","p7zip", "fglrx", "padevchooser", "torchat", "gns3", "xscreensaver", "ksnapshot"]
	  package { $tools:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	$packagesToPurge = ["hplip-gui","gnumeric", "rutilt", "etherape", "gnome-mplayer",  "sylpheed","transgui", "abiword", "wireshark","transmission","transmission-remote-gtk"]
	  package { $packagesToPurge:
	    ensure => "absent",
	    require => Exec['apt-get update']
	 }


}


node default {
	include grundsystem
}
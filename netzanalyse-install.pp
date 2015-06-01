

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


class analysesystem inherits grundsystem::params {
  
	
	$libsToInstall = ["aptitude"]
	  package { $libsToInstall:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	$tools = ["dsniff","finger","tcpdump", "traceroute", "iputils-tracepath"]
	  package { $tools:
	    ensure => "latest",
	    require => Exec['apt-get update']
	  }
	
	
	$packagesToPurge = ["wireshark"]
	  package { $packagesToPurge:
	    ensure => "absent",
	    require => Exec['apt-get update']
	 }


}


node default {
	include analysesystem
}
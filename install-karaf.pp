
#class karaf {
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

class karaf {
	$destination= '/home/huluvu424242/Download/apache-karaf-3.0.1.tar.gz'
	$src='http://mirror.dkd.de/apache/karaf/3.0.1/apache-karaf-3.0.1-src.tar.gz'

	file { "/home/huluvu424242/Download":
	    ensure => directory,
	    mode => 666,
#	    owner => www-data,
#	    group => www-data
	}

	wget::fetch { $src:
	  destination =>$destination,
	  timeout     => 0,
	  verbose     => false,
	  require 	=> file["/home/huluvu424242/Download"],
	}

	

}



node default {
	include karaf
}
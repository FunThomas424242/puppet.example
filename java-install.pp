Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class grundsystem {
  
	
	$libsToInstall = ["libjline-java", "libjava-gnome-java"]
	  package { $libsToInstall:
	    ensure => "latest"
	  }

}


class { 'oraclejava::jdk8' :
  java           => 'jdk-8u66',
  java_loc        => '/opt/java',
  java_dir        => 'jdk1.8.0_66',
  download_url    => 'http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-linux-x64.tar.gz'
} 



node default {
  #include oraclejava
}
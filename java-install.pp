Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class { 'oraclejava::jdk8' :
#  java           => 'jdk-8u11',
  java_loc        => '/opt/java',
#  java_dir        => 'jdk1.8.0_11',
#  download_url    => 'http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-x64.tar.gz'     
} 



#node default {
#  include oraclejava
#}
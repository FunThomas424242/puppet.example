
#maven { "/tmp/maven-core-3.1.1.jar":
#  groupid => "org.apache.maven",
#  artifactid => "maven-core",
#  version => "3.1.1",
#  packaging => "jar",
#  classifier => "",
#  repos => ["http://mvnrepository.com/artifact/"],
#  ensure => "present",
#}

maven { "/tmp/maven-core-3.2.5.jar":
  id => "org.apache.maven:maven-core:3.2.5:jar",
  repos => ["central::default::http://repo.maven.apache.org/maven2","http://mirrors.ibiblio.org/pub/mirrors/maven2"],
}

node default {
	include maven 
#	notice('Well done!')
}

#maven { "/tmp/maven-core-3.1.1.jar":
#  groupid => "org.apache.maven",
#  artifactid => "maven-core",
#  version => "3.1.1",
#  packaging => "jar",
#  classifier => "",
#  repos => ["http://mvnrepository.com/artifact/"],
#  ensure => "present",
#}

maven { "/tmp/myfile":
  groupid => "org.apache.maven",
  artifactid => "maven-core",
  version => "3.3.9",
  packaging => "jar",
  classifier => "sources",
  repos => ["central::default::http://repo.acme.com","http://repo2.acme.com"],
}

#maven { "/tmp/maven-core-3.3.9.jar":
#  id => "org.apache.maven:maven-core:3.3.9:jar",
#  repos => ["central::default::http://repo.maven.apache.org/maven2","http://mirrors.ibiblio.org/pub/mirrors/maven2"],
#}

#node default {
#	include maven 
#	notice('Well done!')
#}

#$central = {
#  id => "myrepo",
#  username => "myuser",
#  password => "mypassword",
#  url => "http://repo.acme.com",
#  mirrorof => "external:*",      # if you want to use the repo as a mirror, see maven::settings below
#}
# $proxy = {
#  active => true, #Defaults to true
#  protocol => 'http', #Defaults to 'http'
#  host => 'http://proxy.acme.com',
#  username => 'myuser', #Optional if proxy does not require
#  password => 'mypassword', #Optional if proxy does not require
#  nonProxyHosts => 'www.acme.com', #Optional, provides exceptions to the proxy
#}

# Install Maven
class { "maven::maven":
  version => "3.3.9", # version to install
  # you can get Maven tarball from a Maven repository instead than from Apache servers, optionally with a user/password
  repo => {
    #url => "http://repo.maven.apache.org/maven2",
    #username => "",
    #password => "",
  }
} ->
 # Setup a .mavenrc file for the specified user
maven::environment { 'maven-env' : 
    user => 'root',
    # anything to add to MAVEN_OPTS in ~/.mavenrc
    maven_opts => '-Xmx1384m',       # anything to add to MAVEN_OPTS in ~/.mavenrc
    maven_path_additions => "",      # anything to add to the PATH in ~/.mavenrc
 }

#->
 # Create a settings.xml with the repo credentials
#maven::settings { 'maven-user-settings' :
#  mirrors => [$central], # mirrors entry in settings.xml, uses id, url, mirrorof from the hash passed
#  servers => [$central], # servers entry in settings.xml, uses id, username, password from the hash passed
#  proxies => [$proxy], # proxies entry in settings.xml, active, protocol, host, username, password, nonProxyHosts
#  user    => 'maven',
#}

 # defaults for all maven{} declarations
Maven {
  user  => "maven", # you can make puppet run Maven as a specific user instead of root, useful to share Maven settings and local repository
  group => "maven", # you can make puppet run Maven as a specific group
  repos => "http://repo.maven.apache.org/maven2"
}
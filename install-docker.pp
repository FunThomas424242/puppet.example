
 $packagesToInstall = [ "wireless-tools", "yum", "wget", "tar"]
  package { $packagesToInstall:
    ensure => "latest",
  }


# docker-module
exec { "garethr-docker":
    command => "sudo puppet module install --force garethr-docker",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

include 'docker'

docker::image { 'ubuntu':
  image_tag => 'trusty'
}

# run eclipse
exec { "run-eclipse":
    command => 'sudo docker run -e "DISPLAY=`hostname -i`:0.0" krujos/eclipse-luna-jdk8',
    path    => "/usr/local/bin/:/bin/:/usr/bin",
    require => Exec['eclipse-luna-jdk8']
}

# https://registry.hub.docker.com/u/krujos/eclipse-luna-jdk8/
#exec { 'eclipse-luna-jdk8':
#    command => "sudo docker pull krujos/eclipse-luna-jdk8",
#    path    => "/usr/local/bin/:/bin/:/usr/bin",
#}

# run eclipse
#exec { "run-eclipse":
#    command => 'sudo docker run -e "DISPLAY=`hostname -i`:0.0" krujos/eclipse-luna-jdk8',
#    path    => "/usr/local/bin/:/bin/:/usr/bin",
#    require => Exec['eclipse-luna-jdk8']
#}




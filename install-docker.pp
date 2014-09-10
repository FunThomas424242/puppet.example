
# docker-module
exec { "garethr-docker":
    command => "sudo puppet module install --force garethr-docker",
    path    => "/usr/local/bin/:/bin/:/usr/bin",
}

include 'docker'

docker::image { 'ubuntu':
  image_tag => 'trusty'
}
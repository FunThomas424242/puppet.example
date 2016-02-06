
class { 'docker':
  tcp_bind    => 'tcp://127.0.0.1:4243',
  socket_bind => 'unix:///var/run/docker.sock',
  docker_users => ['huluvu424242'],
}

include 'docker'





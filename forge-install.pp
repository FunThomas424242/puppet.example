# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}

class  { 'sys::wget': }

define remote_file($remote_location=undef){
 
 file{$title:
   ensure => purge,   
 }
 
  exec{"retrieve_${title}":
    command => "/usr/bin/wget -q ${remote_location} -O ${title}",
    creates => $title,
    require => file["$title"],
  }
}

remote_file{'/tmp/forge-install.sh':
  remote_location => 'http://forge.jboss.org/sh',
#  mode            => '0755',
}


# forge 
exec { "forge":
    #command => "cat /tmp/forge-install.sh | sh",
    command =>"curl http://forge.jboss.org/sh | sh",
    environment => ['JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/'],
    path    => "/usr/local/bin/:/bin/:/usr/bin",
    require => remote_file['/tmp/forge-install.sh']
}

#
#node default {
#	include eclipse 
##	notice('Well done!')
#}
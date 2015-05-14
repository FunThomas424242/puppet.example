# save current vars
file { "/tmp/facts.yaml":
    content => inline_template("<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>"),
}

maven { "/tmp/maven-core-3.1.1.jar":
  id => "org.apache.maven:maven-core:3.1.1:jar",
  repos => ["central::default::http://repo.maven.apache.org/maven2","http://mirrors.ibiblio.org/pub/mirrors/maven2"],
}

node default {
	include maven 
#	notice('Well done!')
}
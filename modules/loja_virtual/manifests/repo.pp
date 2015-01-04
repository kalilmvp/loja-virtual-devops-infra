class loja_virtual::repo($basedir, $reponame) {
  package { "reprepro":
    ensure  =>  installed,
  }

  $repo_structure = [
      "$basedir",
      "$basedir/conf",
  ]

   file { $repo_structure:
     ensure  => "directory",
     owner   => "jenkins",
     group   => "jenkins",
     require => Class["jenkins"],
   }

   file { "$basedir/conf/distributions":
     owner  => "jenkins",
     group  => "jenkins",
     content => template("loja_virtual/distributions.erb"),
   }

   class { "apache": }

   apache::vhost { $reponame:
     port       => 80,
     docroot    => $basedir,
     servername => $ipaddress_eth1,
   }
}

class loja_virtual::monitor {

  include loja_virtual
  include monitor::nagios

  file { "/etc/nagios3/conf.d/loja_virtual.cfg":
      owner		=>	root,
      group   => 	root,
      mode    => 	0644,
      ensure  => present,
      source  => 	"puppet:///modules/loja_virtual/loja_virtual.cfg",
      require => 	Package["nagios3"],
      notify	=>	Service["nagios3"],
    }

  file { "/etc/nagios3/conf.d/contacts_nagios2.cfg":
      owner   => root,
      group   => root,
      mode    => 0644,
      ensure  => present,
      source  => 	"puppet:///modules/loja_virtual/contacts_nagios2.cfg",
      require => Package["nagios3"],
      notify  => Service["nagios3"],
  }

  file { "/etc/nagios3/htpasswd.users":
      owner   => root,
      group   => root,
      mode    => 0644,
      ensure  => present,
      source  => 	"puppet:///modules/loja_virtual/htpasswd.users",
      require => Package["nagios3"],
      notify  => Service["nagios3"],
  }
}

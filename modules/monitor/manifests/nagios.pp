class monitor::nagios {
	exec { "nagios-raring-packages":
	  onlyif    => "test ! -f /etc/apt/sources.list.d/raring.list",
	  command   => "echo \"deb http://old-releases.ubuntu.com/ubuntu raring main\" | sudo tee /etc/apt/sources.list.d/raring.list",
	  path      => ['/usr/bin', '/bin'],
	}

	package { "nagios3":
		ensure 	=> installed,
		require	=>	Exec["nagios-raring-packages"],
	}

	service { "nagios3":
		ensure			=> 	running,
		enable			=> 	true,
		hasstatus		=>	true,
		hasrestart	=>	true,
		require			=>	Package["nagios3"],
	}

}

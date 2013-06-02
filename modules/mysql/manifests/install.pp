class mysql::install {
	package { [ "mysql-common", "mysql-server", "mysql-client"]:
		ensure => present,
		require => User["mysql"];
	}

	user { "mysql":
		ensure => present,
		comment => "Mysql User",
		gid => "mysql",
		shell => "/bin/false",
		require => Group["mysql"],
	}

	group { "mysql":
		ensure => present,
	}
}

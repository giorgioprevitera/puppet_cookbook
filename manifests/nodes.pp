class base {
	include sudo, ssh, puppet
}

node 'puppet.example.com' {
	include base
  include puppet::master
}

node 'client.example.com' {
	include base
	include postfix
}

node 'ubuntu.example.com' {
	include base
	include mysql
	include apache

	apache::vhost { 'www.example.com':
		port => 80,
		docroot => '/var/www/www.example.com',
		ssl => false,
		priority => 10,
		serveraliases => 'home.example.com',
	}
}

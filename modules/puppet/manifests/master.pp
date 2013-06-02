class puppet::master {

  include puppet
  include puppet::params

  package { "puppet-server":
    ensure => present,
  }

  service { "puppetmaster":
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => File["/etc/puppet/puppet.conf"],
  }
}

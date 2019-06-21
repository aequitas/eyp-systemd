class { 'systemd': }

systemd_file::service { 'test':
  execstart => '/bin/sleep 60',
  before    => Service['test'],
}

service { 'test':
  ensure  => 'running',
  require => Class['::systemd_file'],
}

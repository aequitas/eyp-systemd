class { 'systemd': }

systemd_file::service { 'test':
  execstart => '/bin/sleep 60',
  before    => Service['test.timer'],
}

systemd_file::timer { 'test':
  on_boot_sec => '1',
  before      => Service['test.timer'],
}

service { 'test.timer':
  ensure  => 'running',
  require => Class['::systemd_file'],
}

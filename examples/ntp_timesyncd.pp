class { 'systemd_file::timesyncd':
  servers => [
    '0.rhel.pool.ntp.org',
    '1.rhel.pool.ntp.org',
    '2.rhel.pool.ntp.org',
    '3.rhel.pool.ntp.org',
  ],
}

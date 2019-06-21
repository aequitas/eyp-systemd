class { 'systemd': }

systemd_file::target { 'demotarget':
  description => 'demo target acceptance',
}

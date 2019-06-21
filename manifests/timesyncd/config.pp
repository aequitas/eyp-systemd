class systemd_file::timesyncd::config inherits systemd_file::timesyncd {

  file { '/etc/systemd/timesyncd.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/timesyncd.erb"),
  }
}

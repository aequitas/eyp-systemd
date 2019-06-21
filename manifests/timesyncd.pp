class systemd_file::timesyncd(
                          $manage_service        = true,
                          $manage_docker_service = true,
                          $service_ensure        = 'running',
                          $service_enable        = true,
                          $servers               = [],
                          $fallback_servers      = [],
                          $root_distance_max_sec = undef,
                          $poll_interval_min_sec = undef,
                          $poll_interval_max_sec = undef,
                        ) inherits systemd_file::params {

  class { '::systemd_file::timesyncd::config': }
  ~> class { '::systemd_file::timesyncd::service': }
  -> Class['::systemd_file::timesyncd']
}

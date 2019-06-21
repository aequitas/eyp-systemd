class systemd_file::resolved (
                          $manage_service        = true,
                          $manage_docker_service = true,
                          $service_ensure        = 'running',
                          $service_enable        = true,
                          $dns                   = [],
                          $fallback_dns          = [],
                          $dns_stub_listener     = true,
                          $dnssec                = false,
                          $cache                 = true,
                        ) inherits systemd_file::params {


  class { '::systemd_file::resolved::config': }
  ~> class { '::systemd_file::resolved::service': }
  -> Class['::systemd_file::resolved']
}

class systemd_file::timesyncd::service inherits systemd_file::timesyncd {

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $systemd_file::timesyncd::manage_docker_service)
  {
    if($systemd_file::timesyncd::manage_service)
    {
      service { 'systemd-timesyncd':
        ensure     => $systemd_file::timesyncd::service_ensure,
        enable     => $systemd_file::timesyncd::service_enable,
        hasstatus  => true,
        hasrestart => true,
      }
    }
  }
}

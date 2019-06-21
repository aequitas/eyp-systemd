class systemd_file::journald::service inherits systemd_file::journald {

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $systemd_file::journald::manage_docker_service)
  {
    if($systemd_file::journald::manage_service)
    {
      service { 'systemd-journald':
        ensure     => $systemd_file::journald::service_ensure,
        enable     => $systemd_file::journald::service_enable,
        hasstatus  => true,
        hasrestart => true,
      }
    }
  }
}

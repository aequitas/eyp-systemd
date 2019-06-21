class systemd_file::resolved::service inherits systemd_file::resolved {

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $systemd_file::resolved::manage_docker_service)
  {
    if($systemd_file::resolved::manage_service)
    {
      service { 'systemd-resolved':
        ensure     => $systemd_file::resolved::service_ensure,
        enable     => $systemd_file::resolved::service_enable,
        hasstatus  => true,
        hasrestart => true,
      }
    }
  }
}

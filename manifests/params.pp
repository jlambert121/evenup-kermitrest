#
class kermitrest::params {

  $install_repo   = false
  $version        = 'latest'
  $service_ensure = 'running'
  $service_enable = true
  $log_level      = 'INFO'
  $log_file       = '/var/log/kermit-restmco.log'
}

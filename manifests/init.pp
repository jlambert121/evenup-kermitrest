#
class kermitrest (
  $install_repo   = $kermitrest::params::install_repo,
  $version        = $kermitrest::params::version,
  $service_ensure = $kermitrest::params::service_ensure,
  $service_enable = $kermitrest::params::service_enable,
  $log_level      = $kermitrest::params::log_level,
  $log_file       = $kermitrest::params::log_file,
) inherits kermitrest::params {

  class { 'kermitrest::install': }
  class { 'kermitrest::config': }
  class { 'kermitrest::service': }

  if $install_repo {
    case $::osfamily {
      'RedHat': {
        class { 'kermitrest::repo::yum':
          before  => Class['kermitrest::install']
        }
      }
      default:  { fail('OS not supported for repo installation') }
    }
  }

  # Containment
  anchor { 'kermitrest::begin': } ->
  Class['kermitrest::install'] ->
  Class['kermitrest::config'] ->
  Class['kermitrest::service'] ->
  anchor { 'kermitrest::end': }

}


#
class kermitrest::config {

  $log_level = $kermitrest::log_level
  $log_file = $kermitrest::log_file

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { $log_file:
    ensure  => 'file',
    owner   => 'nobody',
    group   => 'nobody',
    mode    => '0644',
  }

  file { '/etc/kermit/kermit-restmco.cfg' :
    ensure  => 'file',
    owner   => 'nobody',
    group   => 'nobody',
    mode    => '0444',
    content => template('kermitrest/kermit-restmco.cfg.erb'),
  }

}

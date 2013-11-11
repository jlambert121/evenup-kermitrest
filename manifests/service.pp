#
class kermitrest::service {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  service { 'kermit-restmco':
    ensure  => $kermitrest::service_ensure,
    enable  => $kermitrest::service_enable,
  }

}

#
class kermitrest::install {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  package { 'kermit-restmco':
    ensure  => $kermitrest::version,
  }

}

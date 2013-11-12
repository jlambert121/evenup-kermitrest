#
class kermitrest::install {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  $gem_prefix = $kermitrest::gem_prefix

  package { ["${gem_prefix}sinatra", "${gem_prefix}inifile", "${gem_prefix}thin"]:
    ensure    => 'installed',
    provider  => $kermitrest::gem_provider,
    before    => Class['kermitrest::service'],
  }

  package { 'kermit-restmco':
    ensure  => $kermitrest::version,
  }

}

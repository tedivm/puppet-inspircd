class inspircd::modules::chanprotect (
  $noservices = 'no',
  $qprefix = '~',
  $aprefix = '&amp;',
  $deprotectself = 'yes',
  $deprotectothers = 'yes',
){

  $config = {
    noservices      => $noservices,
    qprefix         => $qprefix,
    aprefix         => $aprefix,
    deprotectself   => $deprotectself,
    deprotectothers => $deprotectothers,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'chanprotect',
    config      => $config,
    section     => 'modules'
  }

}

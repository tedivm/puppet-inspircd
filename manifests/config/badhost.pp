define inspircd::config::badhost (
  $reason = ''
){

  inspircd::internal::badstuff { "host ${name}":
      type => 'host',
      content => $name,
      reason => $reason,
      order => 26,
  }

}

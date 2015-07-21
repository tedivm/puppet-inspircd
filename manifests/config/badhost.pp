define inspircd::config::badhost (
  $reason = ''
){

  inspircd::config::badstuff { "host ${name}":
      type => 'host',
      content => $name,
      reason => $reason,
      order => 26,
  }

}

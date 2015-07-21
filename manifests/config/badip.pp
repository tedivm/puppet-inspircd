define inspircd::config::badip (
  $reason,
){

  inspircd::config::badstuff { "ip ${name}":
      type => 'ip',
      keyname => 'ipmask',
      content => $name,
      reason => $reason,
      order => 27,
  }

}

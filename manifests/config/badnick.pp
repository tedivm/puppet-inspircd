define inspircd::config::badnick (
  $reason,
) {

  inspircd::config::badstuff { "nick ${name}":
      type => 'nick',
      content => $name,
      reason => $reason,
      order => 28,
  }

}

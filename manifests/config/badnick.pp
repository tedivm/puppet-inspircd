define inspircd::config::badnick (
  $reason,
) {

  inspircd::internal::badstuff { "nick ${name}":
      type    => 'nick',
      content => $name,
      reason  => $reason,
      order   => '25',
  }

}

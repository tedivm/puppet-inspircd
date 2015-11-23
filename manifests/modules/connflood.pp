class inspircd::modules::connflood (
  $seconds = '30',
  $maxconns = '3',
  $timeout = '30',
  $quitmsg = 'Throttled',
  $bootwait = '10',
){

  $config = {
    seconds  => $seconds,
    maxconns => $maxconns,
    timeout  => $timeout,
    quitmsg  => $quitmsg,
    bootwait => $bootwait,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'connflood',
    config      => $config,
    section     => 'modules'
  }

}

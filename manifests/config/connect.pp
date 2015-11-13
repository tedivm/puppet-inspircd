define inspircd::config::connect (
  $order = 10,
  $allow = "*",
  $port = undef,
  $maxchans = undef,
  $timeout = "10",
  $pingfreq = "120",
  $hardsendq = "1M",
  $softsendq = "8192",
  $recvq = "8K",
  $threshold = "10",
  $commandrate = "1000",
  $fakelag = "on",
  $localmax = "3",
  $globalmax = "3",
  $useident = "no",
  $limit = "5000",
  $modes = "+x",
) {

  $config = {
    name => $name,
    allow => $allow,
    port => $port,
    maxchans => $maxchans,
    timeout => $timeout,
    pingfreq => $pingfreq,
    hardsendq => $hardsendq,
    softsendq => $softsendq,
    recvq => $recvq,
    threshold => $threshold,
    commandrate => $commandrate,
    fakelag => $fakelag,
    localmax => $localmax,
    globalmax => $globalmax,
    useident => $useident,
    limit => $limit,
    modes => $modes,
  }

  ::inspircd::internal::configblock { "inspircd connect $name ":
    config_name => "connect",
    config      => $config,
    order       => $order
  }

}

class inspircd::config::limits (
  $maxnick = $inspircd::params::maxnick,
  $maxchan = $inspircd::params::maxchan,
  $maxmodes = $inspircd::params::maxmodes,
  $maxident = $inspircd::params::maxident,
  $maxquit = $inspircd::params::maxquit,
  $maxtopic = $inspircd::params::maxtopic,
  $maxkick = $inspircd::params::maxkick,
  $maxgecos = $inspircd::params::maxgecos,
  $maxaway = $inspircd::params::maxaway,
) inherits inspircd::params {


  $config = {
    maxnick  => $maxnick,
    maxchan  => $maxchan,
    maxmodes => $maxmodes,
    maxident => $maxident,
    maxquit  => $maxquit,
    maxtopic => $maxtopic,
    maxkick  => $maxkick,
    maxgecos => $maxgecos,
    maxaway  => $maxaway,
  }

  ::inspircd::internal::configblock { "inspircd limits ":
    config_name => "limits",
    config      => $config,
    order       => 15
  }


}

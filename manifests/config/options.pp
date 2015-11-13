class inspircd::config::options (
  $prefixquit = $inspircd::params::prefixquit,
  $suffixquit = $inspircd::params::suffixquit,
  $prefixpart = $inspircd::params::prefixpart,
  $suffixpart = $inspircd::params::suffixpart,
  $fixedquit = $inspircd::params::fixedquit,
  $fixedpart = $inspircd::params::fixedpart,
  $syntaxhints = $inspircd::params::syntaxhints,
  $cyclehosts = $inspircd::params::cyclehosts,
  $cyclehostsfromuser = $inspircd::params::cyclehostsfromuser,
  $ircumsgprefix = $inspircd::params::ircumsgprefix,
  $announcets = $inspircd::params::announcets,
  $allowmismatch = $inspircd::params::allowmismatch,
  $defaultbind = $inspircd::params::defaultbind,
  $hostintopic = $inspircd::params::hostintopic,
  $pingwarning = $inspircd::params::pingwarning,
  $serverpingfreq = $inspircd::params::serverpingfreq,
  $defaultmodes = $inspircd::params::defaultmodes,
  $moronbanner = $inspircd::params::moronbanner,
  $exemptchanops = $inspircd::params::exemptchanops,
  $invitebypassmodes = $inspircd::params::invitebypassmodes,
  $nosnoticestack = $inspircd::params::nosnoticestack,
  $welcomenotice = $inspircd::params::welcomenotice,
) inherits inspircd::params {


  $config = {
    prefixquit         => $prefixquit,
    suffixquit         => $suffixquit,
    prefixpart         => $prefixpart,
    suffixpart         => $suffixpart,
    fixedquit          => $fixedquit,
    fixedpart          => $fixedpart,
    syntaxhints        => $syntaxhints,
    cyclehosts         => $cyclehosts,
    cyclehostsfromuser => $cyclehostsfromuser,
    ircumsgprefix      => $ircumsgprefix,
    announcets         => $announcets,
    allowmismatch      => $allowmismatch,
    defaultbind        => $defaultbind,
    hostintopic        => $hostintopic,
    pingwarning        => $pingwarning,
    serverpingfreq     => $serverpingfreq,
    defaultmodes       => $defaultmodes,
    moronbanner        => $moronbanner,
    exemptchanops      => $exemptchanops,
    invitebypassmodes  => $invitebypassmodes,
    nosnoticestack     => $nosnoticestack,
    welcomenotice      => $welcomenotice,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => "options",
    config      => $config,
    order       => "06"
  }

}

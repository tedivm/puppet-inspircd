class inspircd::config::security (
  $announceinvites = $inspircd::params::announceinvites,
  $hidemodes = $inspircd::params::hidemodes,
  $hideulines = $inspircd::params::hideulines,
  $flatlinks = $inspircd::params::flatlinks,
  $hidewhois = $inspircd::params::hidewhois,
  $hidebans = $inspircd::params::hidebans,
  $hidekills = $inspircd::params::hidekills,
  $hidesplits = $inspircd::params::hidesplits,
  $maxtargets = $inspircd::params::maxtargets,
  $customversion = $inspircd::params::customversion,
  $operspywhois = $inspircd::params::operspywhois,
  $runasuser = $inspircd::params::runasuser,
  $runasgroup = $inspircd::params::runasgroup,
  $restrictbannedusers = $inspircd::params::restrictbannedusers,
  $genericoper = $inspircd::params::genericoper,
  $userstats = $inspircd::params::userstats,
) inherits inspircd::params {

  $config = {
    announceinvites     => $announceinvites,
    hidemodes           => $hidemodes,
    hideulines          => $hideulines,
    flatlinks           => $flatlinks,
    hidewhois           => $hidewhois,
    hidebans            => $hidebans,
    hidekills           => $hidekills,
    hidesplits          => $hidesplits,
    maxtargets          => $maxtargets,
    customversion       => $customversion,
    operspywhois        => $operspywhois,
    runasuser           => $runasuser,
    runasgroup          => $runasgroup,
    restrictbannedusers => $restrictbannedusers,
    genericoper         => $genericoper,
    userstats           => $userstats,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'security',
    config      => $config,
    order       => '20'
  }

}

class inspircd::config (

  # SERVER
  $server = $inspircd::params::server,
  $description = $inspircd::params::description,
  $network = $inspircd::params::network,
  $secret = $inspircd::params::secret,

  # ADMIN
  $admin = $inspircd::params::admin,
  $nick = $inspircd::params::nick,
  $email = $inspircd::params::email,

  # OPTIONS
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

  # ENABLE SSL
  $certfile = $inspircd::params::ssl_certfile,
  $keyfile = $inspircd::params::ssl_keyfile,
  $dhfile = undef,
  $cafile = undef,
  $ssl_hash = $inspircd::params::ssl_hash,
  $generate = true,
  $ssl_module = $inspircd::params::ssl_module,
  $extra_conf = {},
  $add_bind = $inspircd::params::ssl_add_bind,
  $bind_ssl_port = $inspircd::params::bind_ssl_port,

  # BIND PORTS
  $bind_ip = $inspircd::params::bind_ip,
  $bind_port = $inspircd::params::bind_port,

  # CHANNELS
  $users = $inspircd::params::users,
  $opers = $inspircd::params::opers,

  # CIDR
  $ipv4clone = $inspircd::params::ipv4clone,
  $ipv6clone = $inspircd::params::ipv6clone,

  # LOG
  $method = $inspircd::params::method,
  $target = $inspircd::params::target,
  $type = $inspircd::params::type,
  $level = $inspircd::params::level,

  # POWER
  $restartpass = '',
  $diepass = '',
  $hash = false,

  # PERFORMANCE
  $netbuffersize = $inspircd::params::method,
  $somaxconn = $inspircd::params::somaxconn,
  $limitsomaxconn = $inspircd::params::limitsomaxconn,
  $softlimit = $inspircd::params::softlimit,
  $quietbursts = $inspircd::params::quietbursts,
  $nouserdns = $inspircd::params::nouserdns,

  # SECURITY
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

  # INSANE
  $hostmasks = $inspircd::params::hostmasks,
  $ipmasks = $inspircd::params::ipmasks,
  $nickmasks = $inspircd::params::nickmasks,
  $trigger = $inspircd::params::trigger,

  # FILES
  $motd = $inspircd::params::motd,
  $rules = $inspircd::params::rules,

  # DISABLED
  $commands = $inspircd::params::commands,
  $usermodes = $inspircd::params::usermodes,
  $chanmodes = $inspircd::params::chanmodes,
  $fakenonexistant = $inspircd::params::fakenonexistant,

  # LIMITS
  $maxnick = $inspircd::params::maxnick,
  $maxchan = $inspircd::params::maxchan,
  $maxmodes = $inspircd::params::maxmodes,
  $maxident = $inspircd::params::maxident,
  $maxquit = $inspircd::params::maxquit,
  $maxtopic = $inspircd::params::maxtopic,
  $maxkick = $inspircd::params::maxkick,
  $maxgecos = $inspircd::params::maxgecos,
  $maxaway = $inspircd::params::maxaway,

  $default_connection = true,

  # WHOWAS Configuration
  $groupsize = $inspircd::params::groupsize,
  $maxgroups = $inspircd::params::maxgroups,
  $maxkeep = $inspircd::params::maxkeep,

  # GENERAL
  $user = $inspircd::params::user,
  $config_dir = $inspircd::params::config_dir,

  $modules = [],
  $default_modules = $inspircd::params::default_modules,

) inherits inspircd::params {

  ::inspircd::config::section { 'inspircd':
    include => false
  }

  $sections = [
    'links',
    'modules',
    'opers',
    'connections'
  ]

  ::inspircd::config::section { $sections: }

  ## Individual Settings

  ::inspircd::config::bind { 'default unencrypted port':
    address => $bind_ip,
    port    => $bind_port,
    type    => 'clients',
  }

  ::inspircd::config::module { $default_modules: }
  ::inspircd::config::module { $modules: }

  if($default_connection) {
    ::inspircd::config::connect { 'default':
      allow => '*',
      order => 99
    }
  }


  class { 'inspircd::config::server':
    server      => $server,
    network     => $network,
    description => $description,
  }

  class { 'inspircd::config::admin':
    admin => $admin,
    nick  => $nick,
    email => $email,
  }

  class { 'inspircd::config::options':
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

  class { 'inspircd::config::channels':
    users => $users,
    opers => $opers,
  }

  class { 'inspircd::config::cidr':
    ipv4clone => $ipv4clone,
    ipv6clone => $ipv6clone,
  }

  class { 'inspircd::config::insane':
    hostmasks => $hostmasks,
    ipmasks => $ipmasks,
    nickmasks => $nickmasks,
    trigger => $trigger,
  }

  class { 'inspircd::config::log':
    method => $method,
    target => $target,
    type   => $type,
    level  => $level,
  }

  class { 'inspircd::config::power':
    restartpass => $restartpass,
    diepass     => $diepass,
    hash        => $hash,
  }

  class { 'inspircd::config::performance':
    netbuffersize  => $netbuffersize,
    somaxconn      => $somaxconn,
    limitsomaxconn => $limitsomaxconn,
    softlimit      => $softlimit,
    quietbursts    => $quietbursts,
    nouserdns      => $nouserdns,
  }

  class { 'inspircd::config::security':
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

  class {'inspircd::config::files':
    motd       => $motd,
    rules      => $rules,
    user       => $user,
    config_dir => $config_dir
  }

  class {'inspircd::config::disabled':
    commands        => $commands,
    usermodes       => $usermodes,
    chanmodes       => $chanmodes,
    fakenonexistant => $fakenonexistant,
  }

  class { 'inspircd::config::limits':
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

  class { 'inspircd::config::whowas':
    groupsize => $groupsize,
    maxgroups => $maxgroups,
    maxkeep   => $maxkeep,
  }

  ::inspircd::config::banlist { 'default':
    chan  => '*',
    limit => '70'
  }

  ::inspircd::config::badnick { $services_users:
    reason => 'Reserved for Services.'
  }

  if($ssl_module != false) {
    class { 'inspircd::config::ssl':
      certfile   => $certfile,
      keyfile    => $keyfile,
      dhfile     => $dhfile,
      cafile     => $cafile,
      hash       => $ssl_hash,
      generate   => $generate,
      module     => $module,
      extra_conf => $extra_conf,
      add_bind   => $add_bind,
      bind_port  => $bind_ssl_port,
    }
  }


}

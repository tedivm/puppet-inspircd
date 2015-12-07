# == Class: inspircd
#
# Full description of class inspircd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'unrealirc':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class inspircd (

  # SERVER
  $server = $inspircd::params::server,
  $description = $inspircd::params::description,
  $network = $inspircd::params::network,


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
  $bind_port = $inspircd::params::bind_ssl_port,


  # BIND PORTS
  $bind_ip = $inspircd::params::bind_ip,
  $bind_port = $inspircd::params::bind_port,


  # CHANNELS
  $users = $inspircd::params::users,
  $oper = $inspircd::params::oper,


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


  # FILES Configuration
  $motd = $inspircd::params::motd,
  $rules = $inspircd::params::rules,


  # DISABLED
  $commands = $inspircd::params::commands,
  $usermodes = $inspircd::params::usermodes,
  $chanmodes = $inspircd::params::chanmodes,
  $fakenonexistant = $inspircd::params::fakenonexistant,


  # LIMITS Configuration
  $maxnick = $inspircd::params::maxnick,
  $maxchan = $inspircd::params::maxchan,
  $maxmodes = $inspircd::params::maxmodes,
  $maxident = $inspircd::params::maxident,
  $maxquit = $inspircd::params::maxquit,
  $maxtopic = $inspircd::params::maxtopic,
  $maxkick = $inspircd::params::maxkick,
  $maxgecos = $inspircd::params::maxgecos,
  $maxaway = $inspircd::params::maxaway,


  # WHOWAS Configuration
  $groupsize = $inspircd::params::groupsize,
  $maxgroups = $inspircd::params::maxgroups,
  $maxkeep = $inspircd::params::maxkeep,



  # System Settings
  $version = $inspircd::params::version,
  $user = $inspircd::params::user,
  $modules = [],
  $service_ensure = $inspircd::params::service_ensure,
  $epoll = $inspircd::params::epoll,
  $kqueue = $inspircd::params::kqueue,


  # Directories
  $base_dir = $inspircd::params::base_dir,
  $prefix = $inspircd::params::prefix,
  $binary_dir = $inspircd::params::binary_dir,
  $module_dir = $inspircd::params::module_dir,
  $config_dir = $inspircd::params::config_dir,
  $data_dir = $inspircd::params::data_dir,
  $log_dir = $inspircd::params::log_dir,
  $download_dir = $inspircd::params::download_dir,

) inherits inspircd::params {

  class { 'inspircd::packages':
    modules => $modules,
  }->

  class { 'inspircd::user':
    user => $user,
  }->

  class { 'inspircd::install':
    version      => $version,
    modules      => $modules,
    epoll        => $epoll,
    kqueue       => $kqueue,
    user         => $user,
    base_dir     => $base_dir,
    binary_dir   => $binary_dir,
    module_dir   => $module_dir,
    config_dir   => $config_dir,
    data_dir     => $data_dir,
    log_dir      => $log_dir,
    download_dir => $download_dir,
  }->

  class { 'inspircd::config':

    server              => $server,
    network             => $network,
    description         => $description,

    modules             => $modules,

    admin               => $admin,
    nick                => $nick,
    email               => $email,

    prefixquit          => $prefixquit,
    suffixquit          => $suffixquit,
    prefixpart          => $prefixpart,
    suffixpart          => $suffixpart,
    fixedquit           => $fixedquit,
    fixedpart           => $fixedpart,
    syntaxhints         => $syntaxhints,
    cyclehosts          => $cyclehosts,
    cyclehostsfromuser  => $cyclehostsfromuser,
    ircumsgprefix       => $ircumsgprefix,
    announcets          => $announcets,
    allowmismatch       => $allowmismatch,
    defaultbind         => $defaultbind,
    hostintopic         => $hostintopic,
    pingwarning         => $pingwarning,
    serverpingfreq      => $serverpingfreq,
    defaultmodes        => $defaultmodes,
    moronbanner         => $moronbanner,
    exemptchanops       => $exemptchanops,
    invitebypassmodes   => $invitebypassmodes,
    nosnoticestack      => $nosnoticestack,
    welcomenotice       => $welcomenotice,


    certfile            => $certfile,
    keyfile             => $keyfile,
    dhfile              => $dhfile,
    cafile              => $cafile,
    ssl_hash            => $ssl_hash,
    generate            => $generate,
    ssl_module          => $ssl_module,
    extra_conf          => $extra_conf,
    add_bind            => $add_bind,
    bind_ssl_port       => $bind_ssl_port,


    bind_ip             => $bind_ip,
    bind_port           => $bind_port,

    users               => $users,
    opers               => $opers,

    ipv4clone           => $ipv4clone,
    ipv6clone           => $ipv6clone,

    hostmasks           => $hostmasks,
    ipmasks             => $ipmasks,
    nickmasks           => $nickmasks,
    trigger             => $trigger,

    method              => $method,
    target              => $target,
    type                => $type,
    level               => $level,

    restartpass         => $restartpass,
    diepass             => $diepass,
    hash                => $hash,

    netbuffersize       => $netbuffersize,
    somaxconn           => $somaxconn,
    limitsomaxconn      => $limitsomaxconn,
    softlimit           => $softlimit,
    quietbursts         => $quietbursts,
    nouserdns           => $nouserdns,

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

    motd                => $motd,
    rules               => $rules,
    user                => $user,

    commands            => $commands,
    usermodes           => $usermodes,
    chanmodes           => $chanmodes,
    fakenonexistant     => $fakenonexistant,

    maxnick             => $maxnick,
    maxchan             => $maxchan,
    maxmodes            => $maxmodes,
    maxident            => $maxident,
    maxquit             => $maxquit,
    maxtopic            => $maxtopic,
    maxkick             => $maxkick,
    maxgecos            => $maxgecos,
    maxaway             => $maxaway,

    groupsize           => $groupsize,
    maxgroups           => $maxgroups,
    maxkeep             => $maxkeep,


    config_dir          => $config_dir,
  }->

  class { 'inspircd::cron':
    prefix => $prefix,
  }->

  class { 'inspircd::service':
    prefix         => $prefix,
    service_ensure => $service_ensure,
  }



}

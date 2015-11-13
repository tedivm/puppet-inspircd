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


  # ADMIN
  $admin = $inspircd::params::admin,
  $nick = $inspircd::params::nick,
  $email = $inspircd::params::email,


  # FILES Configuration
  $motd = $inspircd::params::motd,
  $rules = $inspircd::params::rules,


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
  $extra_modules = [],
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
    extra_modules => $extra_modules,
  }->

  class { 'inspircd::user':
    user => $user,
  }->

  class { 'inspircd::install':
    version       => $version,
    extra_modules => $extra_modules,
    epoll         => $epoll,
    kqueue        => $kqueue,
    user          => $user,
    base_dir      => $base_dir,
    binary_dir    => $binary_dir,
    module_dir    => $module_dir,
    config_dir    => $config_dir,
    data_dir      => $data_dir,
    log_dir       => $log_dir,
    download_dir  => $download_dir,
  }->

  class { 'inspircd::config':

    admin => $admin,
    nick  => $nick,
    email => $email,

    motd       => $motd,
    rules      => $rules,
    user       => $user,

    maxnick  => $maxnick,
    maxchan  => $maxchan,
    maxmodes => $maxmodes,
    maxident => $maxident,
    maxquit  => $maxquit,
    maxtopic => $maxtopic,
    maxkick  => $maxkick,
    maxgecos => $maxgecos,
    maxaway  => $maxaway,

    groupsize => $groupsize,
    maxgroups => $maxgroups,
    maxkeep   => $maxkeep,


    config_dir => $config_dir,
  }->

  class { 'inspircd::cron':
    prefix => $prefix,
  }->

  class { 'inspircd::service':
    prefix         => $prefix,
    service_ensure => $service_ensure,
  }

}

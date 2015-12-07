class inspircd::user (
  $user = $inspircd::params::user
) inherits inspircd::params {

  group { $user:
    ensure => 'present'
  }->

  user { $user:
    ensure     => 'present',
    home       => "/home/${user}",
    managehome => true,
    gid        => $user
  }

}

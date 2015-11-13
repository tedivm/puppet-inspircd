class inspircd::config::admin (
  $admin = $inspircd::params::admin,
  $nick = $inspircd::params::nick,
  $email = $inspircd::params::email,
) inherits inspircd::params {


  $config = {
    name  => $admin,
    nick  => $nick,
    email => $email,
  }

  ::inspircd::internal::configblock { "inspircd admin ":
    config_name => "admin",
    config      => $config,
    order       => "06"
  }


}

class inspircd::config::cidr (
  $ipv4clone = $inspircd::params::ipv4clone,
  $ipv6clone = $inspircd::params::ipv6clone,
) inherits inspircd::params {

  $config = {
    ipv4clone => $ipv4clone,
    ipv6clone => $ipv6clone,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => "cidr",
    config      => $config,
    order       => "10"
  }

}

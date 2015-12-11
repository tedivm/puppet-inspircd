class inspircd::modules::ldapoper (
  $basedn,
  $server,
  $searchscope = 'subtree',
  $binddn = undef,
  $bindauth = undef,
){

  $config = {
    basedn       => $basedn,
    server       => $server,
    searchscope  => $searchscope,
    binddn       => $binddn,
    bindauth     => $bindauth,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'ldapoper',
    config      => $config,
    section     => 'modules'
  }

}

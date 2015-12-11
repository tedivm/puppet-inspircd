class inspircd::modules::ldapauth (
  $basedn,
  $server,
  $attribute = 'uid',
  $allowpattern = undef,
  $killreason = 'Access Denied: Check Password',
  $searchscope = 'subtree',
  $binddn = undef,
  $bindauth = undef,
  $verbose = 'yes',
  $userfield = 'no',
){

  $config = {
    basedn       => $basedn,
    attribute    => $attribute,
    server       => $server,
    allowpattern => $allowpattern,
    killreason   => $killreason,
    searchscope  => $searchscope,
    binddn       => $binddn,
    bindauth     => $bindauth,
    verbose      => $verbose,
    userfield    => $userfield,
  }

  ::inspircd::internal::configblock { "inspircd ${name} ":
    config_name => 'ldapauth',
    config      => $config,
    section     => 'modules'
  }

}

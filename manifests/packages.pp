class inspircd::packages (
  $modules = [],
  $packages = $inspircd::params::packages
) inherits inspircd::params {

  ensure_packages($packages)

  if(member($modules, 'ldapauth') or member($modules, 'ldapoper')) {
    ensure_packages($packages_ldap)
  }

  if(member($modules, 'ssl_gnutls')) {
    ensure_packages($packages_gnutls)
  }

  if(member($modules, 'ssl_openssl')) {
    ensure_packages($packages_openssl)
  }

  if(member($modules, 'geoip')) {
    ensure_packages($packages_geoip)
  }

}

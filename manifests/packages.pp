class inspircd::packages (
  $extra_modules = [],
  $packages = inspircd::params::packages
) inherits inspircd::params {

  ensure_packages($packages)

  if(member($extra_modules, 'ldap')) {
    ensure_packages($packages_ldap)
  }

  if(member($extra_modules, 'ssl_gnutls')) {
    ensure_packages($packages_gnutls)
  }

  if(member($extra_modules, 'ssl_openssl')) {
    ensure_packages($packages_openssl)
  }

  if(member($extra_modules, 'geoip')) {
    ensure_packages($packages_geoip)
  }

}

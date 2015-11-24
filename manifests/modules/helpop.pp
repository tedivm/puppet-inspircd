class inspircd::modules::helpop (
  $content = false,
  $file = 'inspircd/config/helpop.conf.erb',
  $config_dir = $inspircd::config::config_dir,
  $user = $inspircd::config::user,
){
  $config_path = "${config_dir}/helpop.conf"

  if($content) {
    $content_norm = $content
  } elsif($file) {
    $content_norm = template($file)
  }

  file { $config_path:
    content => "${content_norm}\n",
    owner => $user
  }

  $config = {
    file => $config_path,
  }

  ::inspircd::internal::configblock { "inspircd $name ":
    config_name => 'include',
    config      => $config,
    section     => 'modules'
  }

}

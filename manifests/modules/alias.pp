define inspircd::modules::alias (
  $text = $name,
  $replace,

  $usercommand = true,
  $channelcommand = false,
  $format = undef,
  $requires = undef,
  $uline = false,
  $operonly = false,

) {

  if($usercommand) {
    $usercommand_norm = "yes"
  } else {
    $usercommand_norm = "no"
  }

  if($channelcommand) {
    $channelcommand_norm = "yes"
  } else {
    $channelcommand_norm = "no"
  }

  if($uline) {
    $uline_norm = "yes"
  } else {
    $uline_norm = "no"
  }

  if($operonly) {
    $operonly_norm = "yes"
  } else {
    $operonly_norm = "no"
  }

  $config = {
    text => $text,
    replace => $replace,

    usercommand => $usercommand_norm,
    channelcommand => $channelcommand_norm,
    format => $format,
    requires => $requires,
    uline => $uline_norm,
    operonly => $operonly_norm,
  }

  ::inspircd::internal::configblock { "alias ${name}":
    config_name => "alias",
    config => $config,
    section => 'modules'
  }

}

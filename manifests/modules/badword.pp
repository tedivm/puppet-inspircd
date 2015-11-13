define inspircd::modules::badword (
  $replacement = '',
){

  concat::fragment { "${config_dir}/modules.conf badword ${name}":
    target => "${config_dir}/modules.conf",
    content => template('inspircd/config/types/badword.erb'),
    order   => $order
  }

}

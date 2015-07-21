define inspircd::config::badword (
  $replacement = '',
){

  concat::fragment { "${config_dir}/inspircd.conf badword ${name}":
    target => "${config_dir}/inspircd.conf",
    content => template('inspircd/config/types/badword.erb'),
    order   => $order
  }

}

define inspircd::config::section (
  $config_dir = $inspircd::config::config_dir,
  $include = true
){

  $config_file = "${config_dir}/${name}.conf"

  # Create the concat object that other items will build off of.
  concat { $config_file:
    ensure         => 'present',
    warn           => true,
    force          => true,
    order          => 'numeric',
    ensure_newline => true,
    require        => Class['inspircd::install'],
    notify         => Service['inspircd'],
  }

  # Add the default template to the start of the config file.
  concat::fragment { "inspircd ${name} config":
    target  => $config_file,
    content => template("inspircd/config/${name}.conf.erb"),
    order   => 1
  }

  # Add an include for this section in the main configuration.
  if($include) {
    ::inspircd::config::include { "${name} config include":
      path => $config_file
    }
  }

}

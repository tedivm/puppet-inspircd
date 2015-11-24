class inspircd::profiles::unreal (
  $exclude_modules = []
) {

  $modules = [
    'md5',
    'sha256',
    'alias',
    'allowinvite',
    'alltime',
    'auditorium',
    'banexception',
    'blockcaps',
    'blockcolor',
    'botmode',
      'censor',
    'chanfilter',
    'chanprotect',
    'check',
    'chghost',
    'chgident',
    'cloaking',
    'close',
    'clones',
    'commonchans',
    #'conn_join',
    'conn_umodes',
    'cycle',
    #'connflood',
    'dccallow',
    'deaf',
    'denychans',
    'devoice',
      'filter',
    'gecosban',
    'globops',
    'globalload',
    'halfop',
      'helpop',
    'hidechans',
    'hideoper',
    'ident',
    'inviteexception',
    'joinflood',
    'jumpserver',
    'knock',
    'messageflood',
    'namesx',
    'nickflood',
    'noctcp',
    'nokicks',
    'nonicks',
    'nopartmsg',
    'nonotice',
    'operchans',
    'operjoin',
    'operlog',
      'opermotd',
      'override',
    'operlevels',
    'opermodes',
    'password_hash',
    'muteban',
    'redirect',
    'regex_glob',
      #'regex_prce',
    #'regex_posix',
      #'regex_tre',
    #regonlycreate,
    #restrictchans,
    #restrictmsg,
    'sajoin',
    'sakick',
    'samode',
    'sanick',
    'sapart',
    'satopic',
    'saquit',
    'satopic',
    'servprotect',
    'seenicks',
    'setidle',
    'services_account',
    'sethost',
    'setident',
    'setname',
    'showwhois',
    'shun',
    'sslmodes',
    'sslinfo',
    'stripcolor',
    'svshold',
    'swhois',
    'uhnames',
    'userip',
    'watch',
    'spanningtree',
  ]

  $filtered_modules = difference($modules, $exclude_modules)
  ensure_resource('inspircd::config::module', $filtered_modules)


  inspircd::modules::alias { 'NICKSERV':
    replace  => "PRIVMSG NickServ :$2-",
    requires => 'NickServ',
    uline    => 'yes'
  }

  inspircd::modules::alias { 'CHANSERV':
    replace  => "PRIVMSG ChanServ :$2-",
    requires => 'ChanServ',
    uline    => 'yes'
  }

  inspircd::modules::alias { 'OPERSERV':
    replace  => "PRIVMSG OperServ :$2-",
    requires => 'OperServ',
    uline    => 'yes',
    operonly => 'yes'
  }

  inspircd::modules::alias { 'BOTSERV':
    replace  => "PRIVMSG BotServ :$2-",
    requires => 'BotServ',
    uline    => 'yes'
  }

  inspircd::modules::alias { 'HOSTSERV':
    replace  => "PRIVMSG HostServ :$2-",
    requires => 'HostServ',
    uline    => 'yes'
  }

  inspircd::modules::alias { 'MEMOSERV':
    replace  => "PRIVMSG MemoServ :$2-",
    requires => 'MemoServ',
    uline    => 'yes'
  }

  inspircd::modules::alias { 'NS':
    replace  => "PRIVMSG NickServ :$2-",
    requires => 'NickServ',
    uline    => 'yes'
  }

  inspircd::modules::alias { 'CS':
    replace  => "PRIVMSG ChanServ :$2-",
    requires => 'ChanServ',
    uline    => 'yes'
  }

  inspircd::modules::alias { 'OS':
    replace  => "PRIVMSG OperServ :$2-",
    requires => 'OperServ',
    uline    => 'yes',
    operonly => 'yes'
  }

  inspircd::modules::alias { 'BS':
    replace  => "PRIVMSG BotServ :$2-",
    requires => 'BotServ',
    uline    => 'yes'
  }

  inspircd::modules::alias { 'HS':
    replace  => "PRIVMSG HostServ :$2-",
    requires => 'HostServ',
    uline    => 'yes'
  }

  inspircd::modules::alias { 'MS':
    replace  => "PRIVMSG MemoServ :$2-",
    requires => 'MemoServ',
    uline    => 'yes'
  }

  class { 'inspircd::modules::auditorium':
    showops => 'yes',
    operoverride => 'yes',
  }

  class { 'inspircd::modules::blockcaps':
    percent  => '50',
    minlen   => '5',
    capsmap  => 'ABCDEFGHIJKLMNOPQRSTUVWXYZ! ',
  }

  class { 'inspircd::modules::chanfilter':
    hidemask => 'yes',
  }

  class { 'inspircd::modules::chanprotect':
    noservices      => 'no',
    qprefix         => '~',
    aprefix         => '&amp;',
    deprotectself   => 'yes',
    deprotectothers => 'yes',
  }

  class { 'inspircd::modules::hostname':
    charmap => 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-_/0123456789',
  }

  class { 'inspircd::modules::cloak':
    mode => 'half',
    prefix => 'net-'
  }

  class { 'inspircd::modules::hidechans':
    affectsopers => 'false',
  }

  class { 'inspircd::modules::ident':
    timeout => '1',
  }

  class { 'inspircd::modules::shun':
    enabledcommands => 'PING PONG QUIT PART JOIN',
    notifyuser      => 'no',
    affectopers     => 'no',
  }

  class { 'inspircd::modules::helpop':
  }

}

# inspircd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What inspircd affects](#what-inspircd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with inspircd](#beginning-with-inspircd)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Resources](#resources)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

This module downloads, compiles, installs and manages the inspIRCd package.

## Module Description

> InspIRCd is a modular Internet Relay Chat (IRC) server written in C++ for Linux, BSD, Windows and Mac OS X systems which was created from scratch to be stable, modern and lightweight.

> As InspIRCd is one of the few IRC servers written from scratch, it avoids a number of design flaws and performance issues that plague other more established projects, such as UnrealIRCd, while providing the same level of feature parity.

> InspIRCd is one of only a few IRC servers to provide a tunable number of features through the use of an advanced but well documented module system. By keeping core functionality to a minimum we hope to increase the stability, security and speed of InspIRCd while also making it customisable to the needs of many different users.

This puppet module installs and manages inspIRCd and it's own modules. Using
this module an admin can create entire IRC networks directly from Puppet. It
will compile the application directly from source, managing the dependencies of
not just the core application but the extra modules as well. This module also
makes supporting SSL easy by generating the appropriate keys when needed.

## Setup

### What inspircd affects

* Installs inspIRCd on the system, defaulting to the /opt directory.
* Installs needed dependencies, which differ depending on which modules are enabled.
* Creates needed SSL keys to support encrypted communications.
* Adds cronjobs to ensure service continues to run.
* Creates non-root user to run the inspIRCd server.

### Setup Requirements

No special instructions are needed for this module.


### Beginning with inspircd

### Simplest Example

```puppet
class {'inspircd': }
```

This example will install and configure a fully working server using the default
(rather minimalistic) settings.


## Usage

### Add IRCOP

```puppet
::inspircd::config::oper { 'youruser':
  password => 'asparagus',
  host => '*',
  type => 'NetAdmin'
}
```

The above example includes a plaintext password. This gets converted to a hash
by the module, ensuring that the plaintext password does not live on the irc
server itself.

This module also supports using pre-hashed passwords to keep plaintext
credentials out of the manifest.

```puppet
::inspircd::config::oper { 'youruser':
  password => 'PFvazPV0$W9JlnWY6oTWl31CFJb7xbywHNhSGbtXtFhdCZtVNXPC',
  hash => 'hmac-sha256'
  host => '*',
  type => 'NetAdmin'
}
```

### Enable SSL

```puppet
class {'inspircd':
  modules => ['ssl_gnutls']
}
```

Adding an SSL module (either gnutls or openssl) will result in the full ssl
capabilities being added to the project- it will even generate the keys.


### Set DNS

By default inspIRCd uses the system resolvers, but this can be overridden.

```puppet
::inspircd::config::dns { "8.8.8.8": }
```

### Apply a Profile

InspIRCd is incredibly simple at its core, and relies on modules to provide the
features that people are normally used to seeing on IRC networks. This module
contains profiles (based off of the configuration examples provided by inspIRCd)
that attempt to emulate the features of popular ircds.

To match the features of UnrealIRCd just apply the unreal profile.

```puppet
class { "::inspircd::profiles::unreal": }
```


## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Resources



### Define: `inspircd`

These resources are used to define backup points outside of the client of config
files. They create virtual resources that get collected by the config class and
included in the rsnapshot configuration.

##### Parameters


###### Server Options

These options provide some basic information about the server and network.

* `server`: Defaults to $::fqdn.
* `description`: A description of your network.
* `network`: Defaults to the $::domain
* `admin`: The name of the server admin.
* `nick`: The nick of the server admin.
* `email`: The email of the server admin.


###### System

These define a variety of system level settings.

* `version`: This is the version of inspIRCd you want to install. Changing this
  will result in a new version being compiled and installed.
* `user`: The user to run the ircd as.
* `modules`: A list of extra modules to install. Modules can also be enabled with the "module" resource.
* `service_ensure`: Ensure requirement for service (running, stopped).
* `epoll`: Whether to use the epoll (linux) or kqueue (bsd).
* `kqueue`: Whether to use the epoll (linux) or kqueue (bsd).


###### SSL Options

These options allow admins to override the default ssl settings.

* `certfile`: Location of cert file.
* `keyfile`: Location of key file.
* `dhfile`: Location of dhfile.
* `cafile`: Location of cafile. This will need to be set for CA signed keys.
* `ssl_hash`: Which SSL hash to use. Defaults to SHA1, rather than the inspIRCd default of MD5.
* `generate`: Whether or not to automatically generate ssh keys. Set to false to disable.
* `ssl_module`: Which SSL module to use- gnutls or openssl.
* `extra_conf`: Any extra configuration to pass to the SSL module.
* `add_bind`: Whether to create a bind object to let users connect via ssl.



###### Bind Ports

Which IP addresses and ports to use in default bindings.

* `bind_ip`: Default BIND IP address (defaults to all).
* `bind_port`: Default cleartext port (defaults to 6667)
* `bind_ssl_port`: Default ssl port (defaults to 6697)


###### Channel Options

Define the maximum number of channels users and opers can be in.

* `users`: Defaults to 20 channels.
* `oper`: Defaults to 60 channels.


###### Identifying Clones

How much of an IP address should be looked at when identifying clones.

* `ipv4clone`: Defaults to 32 (the full ip address).
* `ipv6clone`: Defaults to 128 (the full ip address).


###### LOG

These define logging methods.

* `method`: Defaults to file.
* `target`: Defines the logging target. For "file" based logs this is a file path.
* `type`: What to log. Defaults to '* -USERINPUT -USEROUTPUT'
* `level`: Defaults to "default"


###### Power

These set the passwords for restarting or shutting down the IRC server. Can either be cleartext or hashed, with cleartext passwords getting hashed before being added to the config.

* `restartpass`:
* `diepass`:
* `hash`: Defaults to false. If set to a hashing algorithm the above options *must* be hashed using that method.


###### Performance

These are a variety of performance related settings.

* `netbuffersize`:
* `somaxconn`:
* `limitsomaxconn`:
* `softlimit`:
* `quietbursts`:
* `nouserdns`:


###### Security

These are a variety of performance security settings.

* `announceinvites`:
* `hidemodes`:
* `hideulines`:
* `flatlinks`:
* `hidewhois`:
* `hidebans`:
* `hidekills`:
* `hidesplits`:
* `maxtargets`:
* `customversion`:
* `operspywhois`:
* `runasuser`:
* `runasgroup`:
* `restrictbannedusers`:
* `genericoper`:
* `userstats`:


###### IRC Options

These options allow for customization of IRC protocol and usage settings.

* `prefixquit`:
* `suffixquit`:
* `prefixpart`:
* `suffixpart`:
* `fixedquit`:
* `fixedpart`:
* `syntaxhints`:
* `cyclehosts`:
* `cyclehostsfromuser`:
* `ircumsgprefix`:
* `announcets`:
* `allowmismatch`:
* `defaultbind`:
* `hostintopic`:
* `pingwarning`:
* `serverpingfreq`:
* `defaultmodes`:
* `moronbanner`:
* `exemptchanops`:
* `invitebypassmodes`:
* `nosnoticestack`:
* `welcomenotice`:


###### Insane

This optional tag allows you to specify how wide a gline, eline, kline, zline or qline can be before it is forbidden from being set.

* `hostmasks`:
* `ipmasks`:
* `nickmasks`:
* `trigger`:


###### Messages

These allow the admin to define messages, such as rules or the motd.

* `motd`: A string containing the MOTD. Defaults to empty.
* `rules`: A string containing the server rules. Defaults to empty.


###### Disabled

These allow admins to disable certain commands or modes.

* `commands`: An array of disabled commands.
* `usermodes`: An array of disabled usermodes.
* `chanmodes`: An array of disabled chanmodes.
* `fakenonexistant`: Whether to state these are banned or claim they are nonexistant. Defaults to "yes".


###### Limits

These define various limits, such as the size of messages or nicks.

* `maxnick`: Defaults to 31 characters.
* `maxchan`: Defaults to 64 characters.
* `maxmodes`: Defaults to 20 characters.
* `maxident`: Defaults to 11 characters.
* `maxquit`: Defaults to 255 characters.
* `maxtopic`: Defaults to 307 characters.
* `maxkick`: Defaults to 255 characters.
* `maxgecos`: Defaults to 128 characters.
* `maxaway`: Defaults to 200 characters.


###### WHOWAS

These define how whowas data should be collected and stored.

* `groupsize`:
* `maxgroups`:
* `maxkeep`:


###### Directories

These define where various components should live. The defaults will very
depending on operating system, with the defaults living in '/opt/inspircd'.

* `base_dir`:
* `prefix`:
* `binary_dir`:
* `module_dir`:
* `config_dir`:
* `data_dir`:
* `log_dir`:
* `download_dir`:



## Limitations

This module is only tested on Ubuntu. Adding additional operating systems should
be as easy as passing the appropriate "path" variables or extending the params
file.

## Development

Contributions are always welcome. Please read the [Contributing Guide](https://github.com/tedivm/puppet-inspircd/CONTRIBUTING.md)
to get started.

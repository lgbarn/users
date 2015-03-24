# == Class: users
#
# Full description of class users here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { users:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
#class users (
#  # class parameters go here
#  ) inherits users::params {
#
#}

class users (
  $vuser_ensure         = $users::params::vuser_ensure,
  $vuser_uid            = $users::params::vuser_uid,
  $vuser_shell          = $users::params::vuser_shell,
  $vuser_home           = $users::params::vuser_home,
  $vuser_comment        = $users::params::vuser_comment,
  $vuser_managehome     = $users::params::vuser_managehome,
  $sshkey_ensure        = $users::params::sshkey_ensure,
  $sshkey_type          = $users::params::sshkey_type,
  $sshkey_key           = $users::params::sshkey_key,
  $sshkey_user          = $users::params::sshkey_user,
  $sshkey_name          = $users::params::sshkey_name,

) inherits users::params {

}

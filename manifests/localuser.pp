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
#class users::virtual {
define users::localuser ($uid,$gid,$realname,$pass="",$sshkey="") {
 
        if ( $pass != "" ) {
        user { $title:
                ensure     =>  "present",
                uid        =>  $uid,
                gid        =>  $gid,
                shell      =>  "/bin/bash",
                home       =>  "/home/$title",
                comment    =>  $realname,
                managehome =>  true,
                password   =>  $pass,
        }
        }
        else {
        user { $title:
                ensure     =>  "present",
                uid        =>  $uid,
                gid        =>  $gid,
                shell      =>  "/bin/bash",
                home       =>  "/home/$title",
                comment    =>  $realname,
                managehome =>   true,
        }
        }
 
        if ( $sshkey != "" ) {
         ssh_authorized_key { $title:
                 ensure    =>  "present",
                 type      =>  "ssh-rsa",
                 key       =>  "$sshkey",
                 user      =>  "$title",
                 require   =>  User["$title"],
                 name      =>  "$title",
         }
        }
}

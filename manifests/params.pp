# Class: postfix::params
#
# This class defines default parameters used by the main module class postfix
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to postfix class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class postfix::params {

  ### Application related parameters

  $package = hiera('postfix::package',$::operatingsystem ? {)
    default => 'postfix',
  })

  $service = hiera('postfix::service',$::operatingsystem ? {)
    default => 'postfix',
  })

  $service_status = hiera('postfix::service_status',$::operatingsystem ? {)
    default => true,
  })

  $process = hiera('postfix::process',$::operatingsystem ? {)
    default => 'master',
  })

  $process_args = hiera('postfix::process_args',$::operatingsystem ? {)
    default => '',
  })

  $process_user = hiera('postfix::process_user',$::operatingsystem ? {)
    default => 'postfix',
  })

  $config_dir = hiera('postfix::config_dir',$::operatingsystem ? {)
    default => '/etc/postfix',
  })

  $config_file = hiera('postfix::config_file',$::operatingsystem ? {)
    default => '/etc/postfix/main.cf',
  })

  $config_file_mode = hiera('postfix::config_file_mode',$::operatingsystem ? {)
    default => '0644',
  })

  $config_file_owner = hiera('postfix::config_file_owner',$::operatingsystem ? {)
    default => 'root',
  })

  $config_file_group = hiera('postfix::config_file_group',$::operatingsystem ? {)
    default => 'root',
  })

  $config_file_init = hiera('postfix::config_file_init',$::operatingsystem ? {)
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/postfix',
    default                   => '/etc/sysconfig/postfix',
  })

  $pid_file = hiera('postfix::pid_file',$::operatingsystem ? {)
    default => '/var/spool/postfix/pid/master.pid',
  })

  $data_dir = hiera('postfix::data_dir',$::operatingsystem ? {)
    default => '/var/spool/postfix',
  })

  $log_dir = hiera('postfix::log_dir',$::operatingsystem ? {)
    default => '',
  })

  $log_file = hiera('postfix::log_file',$::operatingsystem ? {)
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/mail.log',
    default                   => '/var/log/postfix/postfix.log',
  })

  $aliases_source = hiera('postfix::aliases_source',undef)

  $aliases_file = hiera('postfix::aliases_file',$::operatingsystem ? {)
    default => '/etc/aliases',
  })

  $mastercf_file = hiera('postfix::mastercf_file',$::operatingsystem ? {)
    default => '/etc/postfix/master.cf',
  })

  $port = hiera('postfix::port','25')
  $protocol = hiera('postfix::protocol','tcp')

  # General Settings
  $my_class = hiera('postfix::my_class','')
  $source = hiera('postfix::source','')
  $source_dir = hiera('postfix::source_dir','')
  $source_dir_purge = hiera('postfix::source_dir_purge',false)
  $template = hiera('postfix::template','')
  $options = hiera('postfix::options','')
  $service_autorestart = hiera('postfix::service_autorestart',true)
  $restart_command = hiera('postfix::restart_command','')
  $version = hiera('postfix::version','present')
  $absent = hiera('postfix::absent',false)
  $disable = hiera('postfix::disable',false)
  $disableboot = hiera('postfix::disableboot',false)

  ### General module variables that can have a site or per module default
  $monitor = hiera('postfix::monitor',hiera("monitor",false))
  $monitor_tool = hiera('postfix::monitor_tool',hiera("monitor_tool",""))
  $monitor_target = hiera('postfix::monitor_target','localhost')
  $firewall = hiera('postfix::firewall',hiera("firewall",false))
  $firewall_tool = hiera('postfix::firewall_tool',hiera("firewall_tool",""))
  $firewall_src = hiera('postfix::firewall_src','0.0.0.0/0')
  $firewall_dst = hiera('postfix::firewall_dst',$::ipaddress)
  $puppi = hiera('postfix::puppi',,hiera("puppi",false))
  $puppi_helper = hiera('postfix::puppi_helper','standard')
  $debug = hiera('postfix::debug',false)
  $audit_only = hiera('postfix::audit_only',false)



  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

}

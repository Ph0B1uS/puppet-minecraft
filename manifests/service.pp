# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
class minecraft::service {
  file { 'minecraft_init':
    ensure  => file,
    path    => '/etc/init.d/minecraft',
    owner   => 'root',
    group   => 'root',
    mode    => '0744',
    content => template('minecraft/minecraft_init.erb'),
  }

  service { 'minecraft':
    ensure    => running,
    enable    => $minecraft::autostart,
    subscribe => File['minecraft_init'],
  }
}

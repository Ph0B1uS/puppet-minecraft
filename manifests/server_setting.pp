# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
define minecraft::server_setting {
  file { $title :
    ensure  => file,
    path    => "${minecraft::install_dir}/${title}",
    content => template("minecraft/${title}.erb"),
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0664',
    require => User[$minecraft::user],
  }
}

# @summary Manage the server properties file
#
# @param content
#   used by unit tests
define minecraft::server_setting (
  String $content = template("minecraft/${title}.erb"),
) {
  file { $title :
    ensure  => file,
    path    => "${minecraft::install_dir}/${title}",
    content => $content,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0664',
    require => User[$minecraft::user],
  }
}

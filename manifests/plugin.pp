# @summary Manage plugins
#
# @param source
# @param plugin_name
#    The name of the plugin
# @param ensure
#    What to do with the resource, defaults to present
#   include minecraft::properties
define minecraft::plugin (
  String[1] $source,
  String[1] $plugin_name  = $title,
  Any $ensure = present
) {
  if $plugin_name =~ /^.*\.jar$/ {
    fail("minecraft plugin title ${plugin_name} must not end in '.jar'")
  }

  archive { $plugin_name:
    ensure  => $ensure,
    source  => $source,
    path    => "${minecraft::install_dir}/plugins/${plugin_name}.jar",
    notify  => Service['minecraft'],
    require => File["${minecraft::install_dir}/plugins"],
    user    => $minecraft::user,
  }

  if $ensure == present {
    $jar_ensure = file
  } else {
    $jar_ensure = $ensure
  }

  file { "${minecraft::install_dir}/plugins/${plugin_name}.jar":
    ensure  => $jar_ensure,
    owner   => $minecraft::user,
    group   => $minecraft::group,
    mode    => '0644',
    require => Archive[$plugin_name],
  }
}

# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include minecraft::properties
class minecraft::packages {
  if $minecraft::manage_java {
    class { 'java':
      distribution => 'jre',
      version      => 'latest',
    }
  }

  ensure_packages('screen')
}

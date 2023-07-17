# @summary A class to manage the settings for the server
#
# @param minecraft::ops
#   a list of ops
class minecraft::properties {
  minecraft::server_setting { 'server.properties': }

  if defined('$minecraft::ops') {
    minecraft::server_setting { 'ops.txt': }
  }

  if defined('$minecraft::banned_players') != undef {
    minecraft::server_setting { 'banned-players.txt': }
  }

  if defined('$minecraft::banned_ips') != undef {
    minecraft::server_setting { 'banned-ips.txt': }
  }

  if defined('$minecraft::white_list_players') != undef {
    minecraft::server_setting { 'white-list.txt': }
  }
}

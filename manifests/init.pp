# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
class minecraft (
  String[1] $user                 = 'minecraft',      # The user account for the Minecraft service
  String[1] $group                = 'minecraft',      # The user group for the Minecraft service
  Stdlib::Absolutepath $install_dir          = '/opt/minecraft', # Owned by user:group
  String[1] $source               = '1.7.4',          # Minecraft (semvar) or CraftBukkit ('recommended', 'beta', or 'dev'), or direct source (URL for wget)
  Boolean $autostart            = true,             # Start service at boot
  Boolean $manage_java          = true,             # Manage the JRE package
  Integer $heap_size            = '1024',           # The maximum Java heap size in MB
  Integer $heap_start           = '256',            # The initial Java heap size in MB
  Array $plugins              = {},               # Hash of plugins
  Array $ops                  = undef,
  Array $banned_players       = undef,
  Array $banned_ips           = undef,
  Array $white_list_players   = undef,

  # The following are server.properties attributes, see
  # http://minecraft.gamepedia.com/Server.properties for information
  # Empty strings are represented as empty in templates, unlike undef
  String[1] $generator_settings   = '',
  Integer $op_permisison_level  = 4,
  Boolean $allow_nether         = true,
  String[1] $level_name           = 'world',
  Boolean $enable_query         = false,
  Boolean $allow_flight         = false,
  Boolean $announce_achievments = true,
  Integer $server_port          = 25565,
  String[1] $level_type           = 'DEFAULT',
  Boolean $enable_rcon          = false,
  String $rcon_password        = '',
  Integer $rcon_port            = 25575,
  Boolean $force_gamemode       = false,
  Integer $level_seed           = '',
  Stdlib::IP::Address $server_ip            = '',
  Integer $max_build_height     = 256,
  Boolean $spawn_npcs           = true,
  Boolean $white_list           = false,
  Boolean $spawn_animals        = true,
  Boolean $snooper_enabled      = true,
  Boolean $hardcore             = false,
  Boolean $online_mode          = true,
  String[1] $resource_pack        = '',
  Boolean $pvp                  = true,
  Integer $difficulty           = 1,
  Boolean $enable_command_block = false,
  Integer $gamemode             = 0,
  Integer $player_idle_timeout  = 0,
  Integer $max_players          = 20,
  Boolean $spawn_monsters       = true,
  Boolean $gen_structures       = true,
  Integer $view_distance        = 10,
  Integer $spawn_protection     = 16,
String[1] $motd                = 'A Minecraft Server') {
  include minecraft::packages
  include minecraft::properties
  include minecraft::service
  include minecraft::source
  include minecraft::user

  create_resources('minecraft::plugin', $plugins)
}

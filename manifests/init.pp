# @summary Manage and install minecraft java edition server
# 
# @param user
#   The name of the user who will run the server
#
# @param group
#   The name of the group the aformementioned user belongs to
#
# @param install_dir
#   Where to install the server jar file
#
# @param source
#   What version number to install
#
# @param autostart
#   Whether or not to start the server automatically on boot
#
# @param manage_java
#   Should the module manage the system's java package?
#
# @param heap_size
#   The heap size for the jvm
#
# @param heap_start
#   The inital heap size for the jvm
#
# @param plugins
#   Which plugins to install
#
# @param ops
#   An array of the names of the OPs for the server
#
# @param banned_players
#   An array of the names of banned playsers
#
# @param banned_ips
#   An array of banned IPs
#
# @param white_list_players
#   An array of the names of whitelisted players
#
# @param generator_settings
#   Settings for the generator
#
# @param op_permisison_level
#    Permission level for OPs
#
# @param allow_nether
#   Whether or not to allow players to travel to the nether, false turns off portals
#
# @param level_name
#   The value is used as the world name and its directory name
#
# @param enable_query
#    Enables GameSpy4 protocol server listener. Used to get information about server.
#
# @param allow_flight
#    Allows users to use flight on the server while in Survival mode, if they have a mod that provides flight installed.
#    With allow-flight enabled, griefers may become more common, because it makes their work easier. In Creative mode, this has no effect.
#
# @param announce_achievments
#    Has been replaced by gamerule announceAdvancements in version 1.12
#
# @param server_port
#    Specifies what port the server should listen to
#
# @param level_type
#    This is used to determine what kind of world should be generated
#
# @param enable_rcon
#    If set to true, rcon will be enabled
#
# @param rcon_password
#    Sets the rcon password
#
# @param rcon_port
#    Sets the rcon port
#
# @param force_gamemode
#    False (or not defined) prevents the server from sending to the client gamemode values other than the gamemode value saved by 
#    the server during world creation even if those values are set in server.properties after world creation. 
#    True forces the server to send to the client gamemode values other than the gamemode value saved by the server during
#    world creation if those values are set in server.properties after world creation.
#
# @param level_seed
#    Sets a world seed for the player's world, as in Singleplayer. The world generates with a random seed if left blank.
#
# @param server_ip
#    Specifies the server ip
#
# @param max_build_height
#    Was removed in v 1.17
#
# @param spawn_npcs
#    Determines whether villagers can spawn or not.
#
# @param white_list
#    Enables a whitelist on the server. With a whitelist enabled, users not on the whitelist cannot connect. 
#    Intended for private servers, such as those for real-life friends or strangers carefully selected via an 
#    application process, for example. Ops are automatically whitelisted so there's no need to add them explicitly.
#
# @param spawn_animals
#    Determines wheter animals can spawn or not.
#
# @param snooper_enabled
#    Sets whether the server sends snoop data regularly to http://snoop.minecraft.net.
#
# @param hardcore
#    If set to true, server difficulty is ignored and set to hard and players are set to spectator mode if they die.
#
# @param online_mode
#    Server checks connecting players against Minecraft account database. Set this to false only
#    if the player's server is not connected to the Internet.
#    Hackers with fake accounts can connect if this is set to false! If minecraft.net is down or inaccessible,
#    no players can connect if this is set to true.
#    Setting this variable to off purposely is called "cracking" a server, and servers that are
#    present with online mode off are called "cracked" servers, allowing players with unlicensed copies of Minecraft to join.
#
# @param resource_pack
#    Optional URI to a resource pack. The player may choose to use it.
#    The resource pack may not have a larger file size than 250 MiB (Before 1.18: 100 MiB (≈ 100.8 MB)) (Before 1.15: 50 MiB (≈ 50.4 MB)). 
#    Note that download success or failure is logged by the client, and not by the server.
#
# @param pvp
#    Enable PvP on the server. Players shooting themselves with arrows receive damage only if PvP is enabled.
#
# @param difficulty
#    Defines the difficulty (such as damage dealt by mobs and the way hunger and poison affects players) of the server.
#    If a legacy difficulty number is specified, it is silently converted to a difficulty name.
#    peaceful (0)
#    easy (1)
#    normal (2)
#    hard (3)
#
# @param enable_command_block
#    Enables command blocks if set to true
#
# @param gamemode
#    Defines the mode of gameplay.
#    If a legacy gamemode number is specified, it is silently converted to a gamemode name.
#    survival (0)
#    creative (1)
#    adventure (2)
#    spectator (3)
#
# @param player_idle_timeout
#    If non-zero, players are kicked from the server if they are idle for more than that many minutes.
#
# @param max_players
#    The maximum number of players on the server
#
# @param spawn_monsters
#    Determines if monsters can spawn.
#
# @param gen_structures
#    Defines whether structures (such as villages) can be generated.
#
# @param view_distance
#    Sets the amount of world data the server sends the client, measured in chunks in each direction of the player (radius, not diameter). 
#    It determines the server-side viewing distance.
#
# @param spawn_protection
#    Determines the side length of the square spawn protection area as 2x+1. Setting this to 0 disables the spawn protection.
#    A value of 1 protects a 3×3 square centered on the spawn point. 2 protects 5×5, 3 protects 7×7, etc. 
#    This option is not generated on the first server start and appears when the first player joins.
#
# @param motd
#    This is the message that is displayed in the server list of the client, below the name.
#    MOTD supports colour and formatting codes, more info avaliable here: https://minecraft.fandom.com/wiki/Formatting_codes#Use_in_server.properties_and_pack.mcmeta
class minecraft (
  String[1] $user                 = 'minecraft',      # The user account for the Minecraft service
  String[1] $group                = 'minecraft',      # The user group for the Minecraft service
  Stdlib::Absolutepath $install_dir          = '/opt/minecraft', # Owned by user:group
  String[1] $source               = '1.7.4',          # Minecraft (semvar) or CraftBukkit ('recommended', 'beta', or 'dev'), or direct source (URL for wget)
  Boolean $autostart            = true,             # Start service at boot
  Boolean $manage_java          = true,             # Manage the JRE package
  Integer $heap_size            = 1024,           # The maximum Java heap size in MB
  Integer $heap_start           = 256,            # The initial Java heap size in MB
  Array $plugins              = [],               # Hash of plugins
  Array $ops                  = [],
  Array $banned_players       = [],
  Array $banned_ips           = [],
  Array $white_list_players   = [],

  # The following are server.properties attributes, see
  # https://minecraft.gamepedia.com/Server.properties for information
  # Empty strings are represented as empty in templates, unlike undef
  String[1] $generator_settings   = null,
  Integer $op_permisison_level  = 4,
  Boolean $allow_nether         = true,
  String[1] $level_name           = 'world',
  Boolean $enable_query         = false,
  Boolean $allow_flight         = false,
  Boolean $announce_achievments = true,
  Integer $server_port          = 25565,
  String[1] $level_type           = 'DEFAULT',
  Boolean $enable_rcon          = false,
  String $rcon_password        = null,
  Integer $rcon_port            = 25575,
  Boolean $force_gamemode       = false,
  Integer $level_seed           = null,
  Stdlib::IP::Address $server_ip            = '0.0.0.0',
  Integer $max_build_height     = 256,
  Boolean $spawn_npcs           = true,
  Boolean $white_list           = false,
  Boolean $spawn_animals        = true,
  Boolean $snooper_enabled      = true,
  Boolean $hardcore             = false,
  Boolean $online_mode          = true,
  String[1] $resource_pack        = null,
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

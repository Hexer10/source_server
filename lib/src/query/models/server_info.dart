import 'package:freezed_annotation/freezed_annotation.dart';

import 'server_os.dart';
import 'server_type.dart';
import 'server_vac.dart';
import 'server_visibility.dart';

part 'server_info.freezed.dart';

@freezed
abstract class ServerInfo with _$ServerInfo {
  factory ServerInfo({
    /// Protocol version used by the server.
    int protocol,

    /// Name of the server.
    String name,

    /// Map the server has currently loaded.
    String map,

    /// Name of the folder containing the game files.
    String folder,

    /// Full name of the game.
    String game,

    /// Steam Application ID of game.
    int id,

    /// Number of players on the server.
    int players,

    /// Maximum number of players the server reports it can hold.
    int maxPlayers,

    /// Number of bots on the server.
    int bots,

    /// Server type.
    ServerType type,

    /// Server operating system.
    ServerOS os,

    /// Server visibility. Indicates if the server is password protected.
    ServerVisibility visibility,

    /// Server VAC status.
    ServerVAC vac,
    /* TODO: Add TheShip flags */

    /// Version of the game installed on the server.
    String version,

    /// Server's port number.
    @nullable int port,

    /// Server's SteamID.
    @nullable int steamId,

    /// Spectator port number for SourceTV.
    @nullable int tvPort,

    /// Name of the spectator server for SourceTV.
    @nullable String tvName,

    /// Tags that describe the game according to the server (for future use.)
    @nullable String keywords,

    /// The server's 64-bit GameID.
    @nullable int gameId,
  }) = _ServerInfo;
}

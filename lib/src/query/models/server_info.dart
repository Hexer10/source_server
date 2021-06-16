import 'package:freezed_annotation/freezed_annotation.dart';

import 'server_os.dart';
import 'server_type.dart';
import 'server_vac.dart';
import 'server_visibility.dart';

part 'server_info.freezed.dart';

@freezed

/// Info returned from a A2A_INFO packet.
class ServerInfo with _$ServerInfo {
  /// Initialize an instance of [ServerInfo].
  factory ServerInfo({
    /// Protocol version used by the server.
    required int protocol,

    /// Name of the server.
    required String name,

    /// Map the server has currently loaded.
    required String map,

    /// Name of the folder containing the game files.
    required String folder,

    /// Full name of the game.
    required String game,

    /// Steam Application ID of game.
    required int id,

    /// Number of players on the server.
    required int players,

    /// Maximum number of players the server reports it can hold.
    required int maxPlayers,

    /// Number of bots on the server.
    required int bots,

    /// Server type.
    required ServerType type,

    /// Server operating system.
    required ServerOS os,

    /// Server visibility. Indicates if the server is password protected.
    required ServerVisibility visibility,

    /// Server VAC status.
    required ServerVAC vac,
    /* TODO: Add TheShip flags */

    /// Version of the game installed on the server.
    required String version,

    /// Server's port number.
    int? port,

    /// Server's SteamID.
    int? steamId,

    /// Spectator port number for SourceTV.
    int? tvPort,

    /// Name of the spectator server for SourceTV.
    String? tvName,

    /// Tags that describe the game according to the server (for future use.)
    String? keywords,

    /// The server's 64-bit GameID.
    int? gameId,
  }) = _ServerInfo;
}

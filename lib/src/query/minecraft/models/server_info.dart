import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_info.freezed.dart';

@freezed

/// Minecraft Server Info.
class ServerInfo with _$ServerInfo {
  /// Initialize an instance of [ServerInfo].
  factory ServerInfo({
    /// MOTD.
    required String motd,

    /// Gametype.
    required String gametype,

    /// Map.
    required String map,

    /// Number of players on the server.
    required int players,

    /// Maximum number of players the server reports it can hold.
    required int maxPlayers,

    /// Server's port.
    required int port,

    /// Server's name.
    required String ip,
  }) = _ServerInfo;
}

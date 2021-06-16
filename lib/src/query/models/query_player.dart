import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_player.freezed.dart';

@freezed

/// A player info returned from the query protocol.
class QueryPlayer with _$QueryPlayer {
  /// Initialize an instance of [QueryPlayer].
  factory QueryPlayer({
    /// Index of player.
    required int index,

    /// Name of the player.
    required String name,

    /// Player's score (usually "frags" or "kills".)
    required int score,

    /// Time (in seconds) player has been connected to the server.
    required double duration,
  }) = _QueryPlayer;
}

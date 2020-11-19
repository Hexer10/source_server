import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_player.freezed.dart';

@freezed
abstract class QueryPlayer with _$QueryPlayer {
  factory QueryPlayer({
    /// Index of player.
    int index,

    /// Name of the player.
    String name,

    /// Player's score (usually "frags" or "kills".)
    int score,

    /// Time (in seconds) player has been connected to the server.
    double duration,
  }) = _QueryPlayer;
}

class ServerPlayer {
  Map<String, dynamic> _player = Map();

  ServerPlayer(this._player);

  /// Player's name.
  String get name => _player['name'];

  /// Player's userid
  int get userid => _player['userid'];

  /// Player's steamid (STEAM_X...)
  /// This 'BOT' if the player is not human
  String get steamid => _player['steamid'];

  /// Player's onlinetime, null if bot.
  String get onlinetime => _player['onlinetime'];

  /// Player's ping, null if bot.
  int get ping => _player['ping'];

  /// Player's ip, null if bot.
  String get ip => _player['ip'];
}

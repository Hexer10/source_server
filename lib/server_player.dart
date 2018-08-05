
class ServerPlayer{
    Map<String, dynamic> _player = new Map();

    ServerPlayer(this._player);

    String get name => _player['name'];
    String get userid => _player['userid'];
    String get steamid => _player['steamid'];
    String get onlinetime => _player['onlinetime'];
    String get ping => _player['ping'];
    String get ip => _player['ip'];
}
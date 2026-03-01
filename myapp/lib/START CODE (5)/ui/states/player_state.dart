import 'package:flutter/material.dart';
import 'package:myapp/START%20CODE%20(5)/model/songs/song.dart';

class PlayerState extends ChangeNotifier {
  Song? _currentSong;
  Song? get currentSong => _currentSong;
  void play(Song song) {
    _currentSong = song;
    notifyListeners();
  }

  bool isPlaying(Song song) {
    print("${_currentSong.hashCode}");
    print(song.hashCode);
    if (_currentSong.hashCode == song.hashCode) {
      return true;
    } else {
      return false;
    }
  }

  void stop() {
    _currentSong = null;
    notifyListeners();
  }
}

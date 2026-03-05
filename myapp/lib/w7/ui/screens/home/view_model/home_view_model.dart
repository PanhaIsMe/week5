import 'package:flutter/widgets.dart';
import 'package:myapp/w7/data/repositories/songs/song_repository.dart';
import 'package:myapp/w7/data/repositories/user_history/user_history_repositories_mock.dart';
import 'package:myapp/w7/model/songs/song.dart';
import 'package:myapp/w7/ui/states/player_state.dart';

class HomeViewModel extends ChangeNotifier {
  final PlayerState playerState;
  final SongRepository songRepository;
  final UserHistoryRepositoriesMock userHistoryRepositoriesMock;
    List<Song> _songs=[];

  HomeViewModel({required this.playerState, required this.songRepository, required this.userHistoryRepositoriesMock}){init();}
  // HomeViewModel(this.playerState, this.songRepository, this.userHistoryRepositoriesMock);
  List<Song> get historySongs => userHistoryRepositoriesMock.fetchSongsHistory();
  List<Song> get songs => _songs.where((e) => !historySongs.contains(e)).toList();
   bool isPlaying(Song song) {
    return playerState.currentSong == song;
  }
  void init() {
    _songs = songRepository.fetchSongs();
    playerState.addListener(() {
      notifyListeners();
    });
  }

  void playSong(Song song) {
    if (playerState.currentSong == song) {
      playerState.stop();
    } else {
      userHistoryRepositoriesMock.addSongtoHistory(song);
      playerState.start(song);
    }
  }

}
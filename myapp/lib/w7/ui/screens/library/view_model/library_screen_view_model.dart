import 'package:flutter/material.dart';
import 'package:myapp/w7/data/repositories/songs/song_repository.dart';
import 'package:myapp/w7/ui/states/player_state.dart';
import 'package:myapp/w7/model/songs/song.dart';

class LibraryScreenViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  List<Song> _songs =[];
  LibraryScreenViewModel({
    required this.songRepository,

    required this.playerState,
  }){
    init();
  }
List<Song> get songs => _songs;
void init()  {
    _songs =  songRepository.fetchSongs();
    notifyListeners();
  }
void playSong(Song song){
  if(playerState.currentSong!.id== song.id){
    playerState.stop();
  }else{
    playerState.start(song);
  }
}
}

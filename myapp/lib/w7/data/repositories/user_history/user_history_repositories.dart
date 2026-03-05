import 'package:myapp/w7/model/songs/song.dart';

abstract class UserHistoryRepositories {
  List<Song> fetchSongsHistory();
  Song? fetchSongHistoryById(String id);
  void addSongtoHistory(Song song);
}
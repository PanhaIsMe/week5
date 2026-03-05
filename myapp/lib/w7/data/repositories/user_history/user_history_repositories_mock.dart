import 'package:myapp/w7/data/repositories/user_history/user_history_repositories.dart';
import 'package:myapp/w7/model/songs/song.dart';

class UserHistoryRepositoriesMock  implements UserHistoryRepositories{
  final Set<Song> _historySong={};
   @override
  List<Song> fetchSongsHistory() => _historySong.toList();

  @override
  Song? fetchSongHistoryById(String id) =>
      _historySong.where((element) => element.id == id).first;

  @override
  void addSongtoHistory(Song song) {
    _historySong.add(song);
  }
}
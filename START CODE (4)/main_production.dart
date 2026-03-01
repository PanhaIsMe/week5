import 'package:myapp/START%20CODE%20(4)/data/repositories/songs/song_repository.dart';
import 'package:myapp/START%20CODE%20(4)/data/repositories/songs/song_repository_remote.dart';
import 'package:myapp/START%20CODE%20(4)/main_common.dart';
import 'package:provider/provider.dart';

List<Provider> get songRepositoryRemoteRepo {
  return [
    Provider<SongRepository>(create: (context) => SongRepositoryRemote()),
  ];
}

void main(List<String> args) {
  mainCommon(songRepositoryRemoteRepo);
}

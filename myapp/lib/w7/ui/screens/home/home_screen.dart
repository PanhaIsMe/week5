import 'package:flutter/widgets.dart';
import 'package:myapp/w7/data/repositories/songs/song_repository.dart';
import 'package:myapp/w7/data/repositories/user_history/user_history_repositories_mock.dart';
import 'package:myapp/w7/ui/screens/home/content/home_content.dart';
import 'package:myapp/w7/ui/screens/home/view_model/home_view_model.dart';
import 'package:myapp/w7/ui/states/player_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SongRepository songRepository=context.read<SongRepository>();
    UserHistoryRepositoriesMock userHistoryRepositoriesMock= context.watch<UserHistoryRepositoriesMock>();
    PlayerState playerState= context.watch<PlayerState>();
    return ListenableProvider(create: (context)=>HomeViewModel(playerState: playerState, songRepository: songRepository, userHistoryRepositoriesMock: userHistoryRepositoriesMock),child: HomeContent(),);
  }
}
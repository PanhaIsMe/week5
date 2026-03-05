import 'package:flutter/material.dart';
import 'package:myapp/w7/ui/screens/library/content/library_screen_content.dart';
import 'package:myapp/w7/ui/screens/library/view_model/library_screen_view_model.dart';
import 'package:provider/provider.dart';
 
import '../../../data/repositories/songs/song_repository.dart';
// import '../../../model/songs/song.dart';
import '../../states/player_state.dart';
// import '../../states/settings_state.dart';
// import '../../theme/theme.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    SongRepository songRepository = context.read<SongRepository>();
    // List<Song> songs = songRepository.fetchSongs();

    // // 2- Read the globbal settings state
    // AppSettingsState settingsState = context.read<AppSettingsState>();

    // 3 - Watch the globbal player state
    PlayerState playerState = context.watch<PlayerState>();

    return ListenableProvider(create: (context)=>LibraryScreenViewModel(songRepository: songRepository,  playerState: playerState),child: LibraryScreenContent(),);
}}


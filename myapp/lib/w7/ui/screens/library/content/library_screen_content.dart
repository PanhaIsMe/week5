import 'package:flutter/material.dart';

import 'package:myapp/w7/ui/screens/library/view_model/library_screen_view_model.dart';
import 'package:myapp/w7/ui/states/settings_state.dart';
import 'package:provider/provider.dart';
 
import '../../../../model/songs/song.dart';

import '../../../theme/theme.dart';

class LibraryScreenContent extends StatelessWidget {
  const LibraryScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    LibraryScreenViewModel libraryViewModel = context.watch<LibraryScreenViewModel>();
     AppSettingsState settingsState = context.watch<AppSettingsState>();


    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: libraryViewModel.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: libraryViewModel.songs[index],
                isPlaying: libraryViewModel.playerState.currentSong == libraryViewModel.songs[index],
                onTap: () {
                  libraryViewModel.playerState.start(libraryViewModel.songs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:myapp/w7/model/settings/app_settings.dart';
import 'package:myapp/w7/ui/screens/home/view_model/home_view_model.dart';
import 'package:myapp/w7/ui/screens/library/content/library_screen_content.dart';
import 'package:myapp/w7/ui/states/settings_state.dart';
import 'package:myapp/w7/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
  AppSettingsState settingsState=context.watch<AppSettingsState>();
  HomeViewModel homeViewModel= context.watch<HomeViewModel>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),

          SizedBox(height: 50),
          Text("Your recent songs", style: AppTextStyles.label),
          Expanded(
            child: ListView.builder(
              itemCount: homeViewModel.historySongs.length,
              itemBuilder: (context, index) => SongTile(
                song: homeViewModel.historySongs[index],
                isPlaying: homeViewModel.isPlaying(homeViewModel.historySongs[index]),
                onTap: () {
                  // homeViewModel.playerState.start(homeViewModel.songs[index]);
                  homeViewModel.playSong(homeViewModel.historySongs[index]);
                },
              ),
            ),
          ),
          SizedBox(height: 50),
          Text("You might also like", style: AppTextStyles.label),
           Expanded(
            child: ListView.builder(
              itemCount: homeViewModel.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: homeViewModel.songs[index],
                isPlaying: homeViewModel.isPlaying(homeViewModel.songs[index]),
                onTap: () {
                  // homeViewModel.playerState.start(homeViewModel.songs[index]);
                  homeViewModel.playSong(homeViewModel.songs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  
  }
}
import 'package:flutter/material.dart';
import 'package:myapp/w6/ui/states/settings_state.dart';
import 'package:provider/provider.dart';
 
import '../../../model/settings/app_settings.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({super.key});
   final ValueNotifier<ThemeColor> selectedTheme = ValueNotifier(ThemeColor.values.first);

  @override
  Widget build(BuildContext context) {
 final settingsState = context.watch<AppSettingsState>();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Settings", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: settingsState.theme==theme,
                    onTap: (value) {
                      settingsState.changeTheme(value);
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

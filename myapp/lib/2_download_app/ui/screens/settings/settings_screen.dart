import 'package:flutter/material.dart';

import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class ColorNotifier extends ChangeNotifier {
  ThemeColor _color = ThemeColor.blue;
  ThemeColor get color => _color;
  void onChangeColor(ThemeColor color) {
    switch (color) {
      case ThemeColor.blue:
        _color = ThemeColor.blue;
        break;
      case ThemeColor.green:
        _color = ThemeColor.green;
        break;
      case ThemeColor.pink:
        _color = ThemeColor.pink;
        break;
    }
    notifyListeners();
  }
}

ColorNotifier myColorNotifier = ColorNotifier();

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  void onChangeCard(ThemeColor color) {
    myColorNotifier.onChangeColor(color);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: myColorNotifier,
      builder: (context, _) {
        return Container(
          color: myColorNotifier.color.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                "Settings",
                style: AppTextStyles.heading.copyWith(
                  color: myColorNotifier.color.color,
                ),
              ),
        
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
                        
                        isSelected: theme == myColorNotifier.color,
                        onTap: (value) {
                          onChangeCard(theme);
                        },
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      }
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:myapp/w6/data/repositories/settings/settings_repository.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  AppSettings? _appSettings;
  final SettingRepository settingRepository;

  AppSettingsState(this.settingRepository);

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await settingRepository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.pink;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);
    await settingRepository.save(_appSettings!);

    notifyListeners();
  }
}

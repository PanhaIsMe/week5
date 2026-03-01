import 'package:myapp/w6/data/repositories/settings/settings_repository.dart';
import 'package:myapp/w6/model/settings/app_settings.dart';
class SettingRepositoryMock implements SettingRepository {
  AppSettings _settings = AppSettings(themeColor: ThemeColor.green);

  @override
  Future<AppSettings> load() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _settings;
  }

  @override
  Future<void> save(AppSettings setting) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _settings = setting;
  }
}

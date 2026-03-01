import 'package:myapp/w6/model/settings/app_settings.dart';

abstract class SettingRepository {
  Future<AppSettings> load();
  Future<void> save(AppSettings setting);
}

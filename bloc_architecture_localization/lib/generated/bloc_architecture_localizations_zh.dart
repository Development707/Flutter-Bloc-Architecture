import 'bloc_architecture_localizations.dart';

/// The translations for Chinese (`zh`).
class BlocArchitectureLocalizationsZh extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get somethingWentWrong => '发生了一些错误';

  @override
  String get now => '现在';

  @override
  String get fewSecondsAgo => '几秒前';

  @override
  String minutesRelative(Object minutes) {
    return '$minutes 分钟前';
  }

  @override
  String hoursRelative(Object hours) {
    return '$hours 小时前';
  }

  @override
  String daysRelative(Object days) {
    return '$days 天前';
  }

  @override
  String get search => '搜索';

  @override
  String get pleaseUpgradeToNewVersion => '请升级到新版本';

  @override
  String get serverIsUnderMaintenance => '服务器正在维护';

  @override
  String get networkConnectionIsUnstable => '网络连接不稳定';

  @override
  String get anErrorHasOccurred => '发生了一个错误';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => '您的会话已过期，请重新登录';
}

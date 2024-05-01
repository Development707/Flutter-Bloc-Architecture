import 'bloc_architecture_localizations.dart';

/// The translations for Vietnamese (`vi`).
class BlocArchitectureLocalizationsVi extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get somethingWentWrong => 'Some thing went wrong';

  @override
  String get now => 'Now';

  @override
  String get fewSecondsAgo => 'Few seconds ago';

  @override
  String minutesRelative(Object minutes) {
    return '$minutes minutes ago';
  }

  @override
  String hoursRelative(Object hours) {
    return '$hours hours ago';
  }

  @override
  String daysRelative(Object days) {
    return '$days days ago';
  }

  @override
  String get search => 'Search';

  @override
  String get pleaseUpgradeToNewVersion => 'Vui lòng nâng cấp phiên bản mới';

  @override
  String get serverIsUnderMaintenance => 'Máy chủ đang bảo trì';

  @override
  String get networkConnectionIsUnstable => 'Kết nối mạng không ổn định';

  @override
  String get anErrorHasOccurred => 'Đã có lỗi xảy ra';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => 'Phiên của bạn đã hết hạn, vui lòng đăng nhập lại';
}

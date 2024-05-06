import 'bloc_architecture_localizations.dart';

/// The translations for Vietnamese (`vi`).
class BlocArchitectureLocalizationsVi extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get anErrorHasOccurred => 'Đã có lỗi xảy ra';

  @override
  String get cancel => 'Hủy';

  @override
  String daysRelative(Object days) {
    return '$days ngày trước';
  }

  @override
  String get fewSecondsAgo => 'Vài giây trước';

  @override
  String hoursRelative(Object hours) {
    return '$hours giờ trước';
  }

  @override
  String minutesRelative(Object minutes) {
    return '$minutes phút trước';
  }

  @override
  String get networkConnectionIsUnstable => 'Kết nối mạng không ổn định';

  @override
  String get no => 'Không';

  @override
  String get noItemsFound => 'Không tìm thấy';

  @override
  String get now => 'Bây giờ';

  @override
  String get ok => 'Ok';

  @override
  String get pleaseUpgradeToNewVersion => 'Vui lòng nâng cấp phiên bản mới';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get serverIsUnderMaintenance => 'Máy chủ đang bảo trì';

  @override
  String get somethingWentWrong => 'Đã có lỗi xử lý';

  @override
  String get yes => 'Có';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => 'Phiên của bạn đã hết hạn, vui lòng đăng nhập lại';
}

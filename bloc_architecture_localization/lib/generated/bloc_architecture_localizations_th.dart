import 'bloc_architecture_localizations.dart';

/// The translations for Thai (`th`).
class BlocArchitectureLocalizationsTh extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get noItemsFound => 'ไม่พบข้อมูล';

  @override
  String get somethingWentWrong => 'เกิดข้อผิดพลาดบางอย่าง';

  @override
  String get now => 'ตอนนี้';

  @override
  String get fewSecondsAgo => 'ไม่กี่วินาที่แล้ว';

  @override
  String minutesRelative(Object minutes) {
    return '$minutes นาที่แล้ว';
  }

  @override
  String hoursRelative(Object hours) {
    return '$hours ชั่วโมงที่แล้ว';
  }

  @override
  String daysRelative(Object days) {
    return '$days วันที่แล้ว';
  }

  @override
  String get search => 'ค้นหา';

  @override
  String get pleaseUpgradeToNewVersion => 'กรุณาอัปเดตเป็นเวอร์ชันใหม่';

  @override
  String get serverIsUnderMaintenance => 'เซิร์ฟเวอร์อยู่ในสถานะการบำรุงรักษา';

  @override
  String get networkConnectionIsUnstable => 'เชื่อมต่อเว็บไซต์ไม่ส Ladder';

  @override
  String get anErrorHasOccurred => 'เกิดข้อผิดพลาดบางอย่าง';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => 'เซสชันของคุณหมดอายุกรุณาลงชื่อเข้าสู่ระบบอีกครั้ง';
}

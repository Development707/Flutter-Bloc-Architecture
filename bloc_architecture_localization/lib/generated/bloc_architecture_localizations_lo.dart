import 'bloc_architecture_localizations.dart';

/// The translations for Lao (`lo`).
class BlocArchitectureLocalizationsLo extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsLo([String locale = 'lo']) : super(locale);

  @override
  String get anErrorHasOccurred => 'ການອາດເກົ່າຂອງເຈົ້າຂອງ';

  @override
  String get cancel => 'ຍົກເລີກ';

  @override
  String daysRelative(Object days) {
    return '$days ມື້ກັບກ່ອນ';
  }

  @override
  String get fewSecondsAgo => 'ການອາດບັນຫານຫວ່າງ';

  @override
  String hoursRelative(Object hours) {
    return '$hours ໂມງປີກັບກ່ອນ';
  }

  @override
  String minutesRelative(Object minutes) {
    return '$minutes ເວນປີກັບກ່ອນ';
  }

  @override
  String get networkConnectionIsUnstable => 'ລະບຸດພະນັກກຳກຽງຂອງການຕົງການຂ້າງຂອ້ນ';

  @override
  String get no => 'ບໍ່';

  @override
  String get noItemsFound => 'ບໍ່ພົບລາຍການ';

  @override
  String get now => 'ຫາງນາມາຫຼ້';

  @override
  String get ok => 'ຕົກລົງ';

  @override
  String get pleaseUpgradeToNewVersion => 'ກະລຸນາປ່ຽນການອັດຕາເຂົ້າໃຊ້ຂອບແປງໃຊ້ເວີທີທີ່';

  @override
  String get search => 'ຄົ້ນຫາ';

  @override
  String get serverIsUnderMaintenance => 'ລະບຸດຜົນເຄື່ອໄດ້ເຈົ້າຂອງພະບຍດຕາມ';

  @override
  String get somethingWentWrong => 'ການອາດແພັເພາບລົງໃຈ';

  @override
  String get yes => 'ແມ່';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => 'ວົງທີ່ທີ່ປົງກະເປທກ່ອນອັບການເຂົ້າໃຊ້ການອັບການອັບການແລ້ວ';
}

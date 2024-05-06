import 'bloc_architecture_localizations.dart';

/// The translations for English (`en`).
class BlocArchitectureLocalizationsEn extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get anErrorHasOccurred => 'An error has occurred';

  @override
  String get cancel => 'Cancel';

  @override
  String daysRelative(Object days) {
    return '$days days ago';
  }

  @override
  String get fewSecondsAgo => 'Few seconds ago';

  @override
  String hoursRelative(Object hours) {
    return '$hours hours ago';
  }

  @override
  String minutesRelative(Object minutes) {
    return '$minutes minutes ago';
  }

  @override
  String get networkConnectionIsUnstable => 'Network connection is unstable';

  @override
  String get no => 'No';

  @override
  String get noItemsFound => 'No items found';

  @override
  String get now => 'Now';

  @override
  String get ok => 'Ok';

  @override
  String get pleaseUpgradeToNewVersion => 'Please upgrade to new version';

  @override
  String get search => 'Search';

  @override
  String get serverIsUnderMaintenance => 'Server is under maintenance';

  @override
  String get somethingWentWrong => 'Some thing went wrong';

  @override
  String get yes => 'Yes';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => 'Your session has expired, please log in again';
}

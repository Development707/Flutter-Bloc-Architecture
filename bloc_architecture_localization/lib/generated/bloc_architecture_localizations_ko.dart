import 'bloc_architecture_localizations.dart';

/// The translations for Korean (`ko`).
class BlocArchitectureLocalizationsKo extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get somethingWentWrong => '예기치 않은 오류가 발생했습니다.';

  @override
  String get now => '지금';

  @override
  String get fewSecondsAgo => '몇 초 전';

  @override
  String minutesRelative(Object minutes) {
    return '$minutes 분 전';
  }

  @override
  String hoursRelative(Object hours) {
    return '$hours 시간 전';
  }

  @override
  String daysRelative(Object days) {
    return '$days 일 전';
  }

  @override
  String get search => '검색';

  @override
  String get pleaseUpgradeToNewVersion => '최신 버전으로 업데이트해주세요';

  @override
  String get serverIsUnderMaintenance => '서버가 점검중입니다.';

  @override
  String get networkConnectionIsUnstable => '네트워크 연결이 불안정합니다.';

  @override
  String get anErrorHasOccurred => '오류가 발생했습니다.';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => '세션이 만료되었습니다. 다시 로그인 해주세요';
}

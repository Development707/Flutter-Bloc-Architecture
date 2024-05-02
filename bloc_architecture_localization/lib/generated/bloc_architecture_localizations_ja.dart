import 'bloc_architecture_localizations.dart';

/// The translations for Japanese (`ja`).
class BlocArchitectureLocalizationsJa extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get noItemsFound => '見つかりませんでした';

  @override
  String get somethingWentWrong => '何かが間違ったようです';

  @override
  String get now => '今';

  @override
  String get fewSecondsAgo => '数秒前';

  @override
  String minutesRelative(Object minutes) {
    return '$minutes 分前';
  }

  @override
  String hoursRelative(Object hours) {
    return '$hours 時間前';
  }

  @override
  String daysRelative(Object days) {
    return '$days 日前';
  }

  @override
  String get search => '検索';

  @override
  String get pleaseUpgradeToNewVersion => '新しいバージョンにアップグレードしてください';

  @override
  String get serverIsUnderMaintenance => 'サーバーはメンテナンス中です';

  @override
  String get networkConnectionIsUnstable => 'ネットワーク接続が不安定です';

  @override
  String get anErrorHasOccurred => 'エラーが発生しました';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => 'あなたのセッションは期限切れです、再度ログインしてください';
}

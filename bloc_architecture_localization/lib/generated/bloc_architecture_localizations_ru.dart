import 'bloc_architecture_localizations.dart';

/// The translations for Russian (`ru`).
class BlocArchitectureLocalizationsRu extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get noItemsFound => 'Ничего не найдено';

  @override
  String get somethingWentWrong => 'Что-то пошло не так';

  @override
  String get now => 'Теперь';

  @override
  String get fewSecondsAgo => 'Несколько секунд назад';

  @override
  String minutesRelative(Object minutes) {
    return '$minutes минут назад';
  }

  @override
  String hoursRelative(Object hours) {
    return '$hours часов назад';
  }

  @override
  String daysRelative(Object days) {
    return '$days дней назад';
  }

  @override
  String get search => 'Поиск';

  @override
  String get pleaseUpgradeToNewVersion => 'Пожалуйста, обновите версию';

  @override
  String get serverIsUnderMaintenance => 'Сервер находится в режиме обслуживания';

  @override
  String get networkConnectionIsUnstable => 'Соединение с сетью нестабильное';

  @override
  String get anErrorHasOccurred => 'Произошла ошибка';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => 'Сессия истекла, пожалуйста, войдите в систему снова';
}

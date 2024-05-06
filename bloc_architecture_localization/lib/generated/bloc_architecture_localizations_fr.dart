import 'bloc_architecture_localizations.dart';

/// The translations for French (`fr`).
class BlocArchitectureLocalizationsFr extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get anErrorHasOccurred => 'Une erreur s\'est produite';

  @override
  String get cancel => 'Annuler';

  @override
  String daysRelative(Object days) {
    return '$days jours passés';
  }

  @override
  String get fewSecondsAgo => 'Il y a quelques secondes';

  @override
  String hoursRelative(Object hours) {
    return '$hours heures passées';
  }

  @override
  String minutesRelative(Object minutes) {
    return '$minutes minutes passées';
  }

  @override
  String get networkConnectionIsUnstable => 'La connexion réseau n\'est pas stable';

  @override
  String get no => 'Non';

  @override
  String get noItemsFound => 'Aucun élément n\'a été trouvé';

  @override
  String get now => 'Maintenant';

  @override
  String get ok => 'OK';

  @override
  String get pleaseUpgradeToNewVersion => 'Veuillez mettre à jour vers la nouvelle version';

  @override
  String get search => 'Recherche';

  @override
  String get serverIsUnderMaintenance => 'Le serveur est en maintenance';

  @override
  String get somethingWentWrong => 'Quelque chose s\'est mal passé';

  @override
  String get yes => 'Oui';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => 'Votre session a expirée, veuillez vous reconnecter';
}

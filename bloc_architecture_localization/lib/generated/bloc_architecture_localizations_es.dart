import 'bloc_architecture_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class BlocArchitectureLocalizationsEs extends BlocArchitectureLocalizations {
  BlocArchitectureLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get anErrorHasOccurred => 'Se ha producido un error';

  @override
  String get cancel => 'Cancelar';

  @override
  String daysRelative(Object days) {
    return '$days días atrás';
  }

  @override
  String get fewSecondsAgo => 'Hace unos segundos';

  @override
  String hoursRelative(Object hours) {
    return '$hours horas atrás';
  }

  @override
  String minutesRelative(Object minutes) {
    return '$minutes minutos atrás';
  }

  @override
  String get networkConnectionIsUnstable => 'La conexión de red no es estable';

  @override
  String get no => 'No';

  @override
  String get noItemsFound => 'No se encontraron elementos';

  @override
  String get now => 'Ahora';

  @override
  String get ok => 'OK';

  @override
  String get pleaseUpgradeToNewVersion => 'Por favor, actualiza a una nueva versión';

  @override
  String get search => 'Buscar';

  @override
  String get serverIsUnderMaintenance => 'El servidor está en mantenimiento';

  @override
  String get somethingWentWrong => 'Algo salió mal';

  @override
  String get yes => 'Si';

  @override
  String get yourSessionHasExpiredPleaseLogInAgain => 'Su sesión ha expirado. Por favor, inicie sesión de nuevo';
}

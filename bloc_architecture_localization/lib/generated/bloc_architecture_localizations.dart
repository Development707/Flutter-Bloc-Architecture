import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'bloc_architecture_localizations_de.dart';
import 'bloc_architecture_localizations_en.dart';
import 'bloc_architecture_localizations_es.dart';
import 'bloc_architecture_localizations_fr.dart';
import 'bloc_architecture_localizations_ja.dart';
import 'bloc_architecture_localizations_ko.dart';
import 'bloc_architecture_localizations_lo.dart';
import 'bloc_architecture_localizations_ru.dart';
import 'bloc_architecture_localizations_th.dart';
import 'bloc_architecture_localizations_vi.dart';
import 'bloc_architecture_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of BlocArchitectureLocalizations
/// returned by `BlocArchitectureLocalizations.of(context)`.
///
/// Applications need to include `BlocArchitectureLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/bloc_architecture_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: BlocArchitectureLocalizations.localizationsDelegates,
///   supportedLocales: BlocArchitectureLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the BlocArchitectureLocalizations.supportedLocales
/// property.
abstract class BlocArchitectureLocalizations {
  BlocArchitectureLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static BlocArchitectureLocalizations? of(BuildContext context) {
    return Localizations.of<BlocArchitectureLocalizations>(context, BlocArchitectureLocalizations);
  }

  static const LocalizationsDelegate<BlocArchitectureLocalizations> delegate = _BlocArchitectureLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ja'),
    Locale('ko'),
    Locale('lo'),
    Locale('ru'),
    Locale('th'),
    Locale('vi'),
    Locale('zh')
  ];

  /// No description provided for @noItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get noItemsFound;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Some thing went wrong'**
  String get somethingWentWrong;

  /// No description provided for @now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// No description provided for @fewSecondsAgo.
  ///
  /// In en, this message translates to:
  /// **'Few seconds ago'**
  String get fewSecondsAgo;

  /// No description provided for @minutesRelative.
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes ago'**
  String minutesRelative(Object minutes);

  /// No description provided for @hoursRelative.
  ///
  /// In en, this message translates to:
  /// **'{hours} hours ago'**
  String hoursRelative(Object hours);

  /// No description provided for @daysRelative.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String daysRelative(Object days);

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @pleaseUpgradeToNewVersion.
  ///
  /// In en, this message translates to:
  /// **'Please upgrade to new version'**
  String get pleaseUpgradeToNewVersion;

  /// No description provided for @serverIsUnderMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Server is under maintenance'**
  String get serverIsUnderMaintenance;

  /// No description provided for @networkConnectionIsUnstable.
  ///
  /// In en, this message translates to:
  /// **'Network connection is unstable'**
  String get networkConnectionIsUnstable;

  /// No description provided for @anErrorHasOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred'**
  String get anErrorHasOccurred;

  /// No description provided for @yourSessionHasExpiredPleaseLogInAgain.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired, please log in again'**
  String get yourSessionHasExpiredPleaseLogInAgain;
}

class _BlocArchitectureLocalizationsDelegate extends LocalizationsDelegate<BlocArchitectureLocalizations> {
  const _BlocArchitectureLocalizationsDelegate();

  @override
  Future<BlocArchitectureLocalizations> load(Locale locale) {
    return SynchronousFuture<BlocArchitectureLocalizations>(lookupBlocArchitectureLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr', 'ja', 'ko', 'lo', 'ru', 'th', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_BlocArchitectureLocalizationsDelegate old) => false;
}

BlocArchitectureLocalizations lookupBlocArchitectureLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return BlocArchitectureLocalizationsDe();
    case 'en': return BlocArchitectureLocalizationsEn();
    case 'es': return BlocArchitectureLocalizationsEs();
    case 'fr': return BlocArchitectureLocalizationsFr();
    case 'ja': return BlocArchitectureLocalizationsJa();
    case 'ko': return BlocArchitectureLocalizationsKo();
    case 'lo': return BlocArchitectureLocalizationsLo();
    case 'ru': return BlocArchitectureLocalizationsRu();
    case 'th': return BlocArchitectureLocalizationsTh();
    case 'vi': return BlocArchitectureLocalizationsVi();
    case 'zh': return BlocArchitectureLocalizationsZh();
  }

  throw FlutterError(
    'BlocArchitectureLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

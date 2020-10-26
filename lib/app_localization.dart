import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/models/config.dart';

class AppLocalization {
  AppLocalization._();

  static Localization fromLocaleId(String id) {
    return values.firstWhere(
      (locale) => locale.id == id,
      orElse: () => fallback,
    );
  }

  static const en = _LocalizationEn();

  static const fallback = en;

  static const values = <Localization>[
    en
  ];

  static Localization get instance => GetIt.instance<Config>().localization;
}

@immutable
abstract class Localization {
  const Localization();

  String get id;
  String get name;
  String get fallbackName;
  String get icon;
  String get title => 'Gourav Khunger | Android and Web developer | Blogger';
  String get about => 'About';
  String get firstName => 'Gourav';
  String get lastName => 'Khunger';
  String get nickName => 'Gourav';
  String get commonName => nickName;
  String get greetingMorning => 'Good morning.';
  String get greetingAfternoon => 'Good afternoon.';
  String get greetingEvening => 'Good evening.';
  String get introductionPrefix => "I'm ";
  String get introductionSuffix => '.';

  String get highlightSoftwareDeveloperTitle => 'Coding Enthusiast';
  String get highlightSoftwareDeveloperDescription =>
      'Android, Web, Competitive and more.';

  String get highlightBlogger => 'Blogger';
  String get highlightBlogDescription =>
      'Frequent Content-Writer';

  String get highlightOpenSourceContributorTitle => 'Open Source Contributor';
  String get highlightOpenSourceContributorDescription =>
      'Loves GitHub.';

  String get highlightStudentTitle => 'Student';
  String get highlightStudentDescription => 'Currently in grade 10.';

  String get highlightGameTitle => 'BasketBall Player';
  String get highlightGameDescription => 'Love to play Basketball.';

  String get siteInfo =>
      'gourav-khunger.web.dev ・ Fazilka, Punjab, India';

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) || other is Localization && id == other.id;
}

class _LocalizationEn extends Localization {
  const _LocalizationEn();

  @override
  String get id => 'en';
  @override
  String get name => 'English (US)';
  @override
  String get fallbackName => name;
  @override
  String get icon => '🇺🇸';
}
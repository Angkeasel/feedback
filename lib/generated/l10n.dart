// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L {
  L();

  static L? _current;

  static L get current {
    assert(_current != null,
        'No instance of L was loaded. Try to initialize the L delegate before accessing L.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L();
      L._current = instance;

      return instance;
    });
  }

  static L of(BuildContext context) {
    final instance = L.maybeOf(context);
    assert(instance != null,
        'No instance of L present in the widget tree. Did you add L.delegate in localizationsDelegates?');
    return instance!;
  }

  static L? maybeOf(BuildContext context) {
    return Localizations.of<L>(context, L);
  }

  /// `Excellent`
  String get excellent {
    return Intl.message(
      'Excellent',
      name: 'excellent',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get good {
    return Intl.message(
      'Good',
      name: 'good',
      desc: '',
      args: [],
    );
  }

  /// `Could be better`
  String get couldBeBetter {
    return Intl.message(
      'Could be better',
      name: 'couldBeBetter',
      desc: '',
      args: [],
    );
  }

  /// `Need Improvement`
  String get needImprovement {
    return Intl.message(
      'Need Improvement',
      name: 'needImprovement',
      desc: '',
      args: [],
    );
  }

  /// `Quality`
  String get quality {
    return Intl.message(
      'Quality',
      name: 'quality',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message(
      'Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Hygiene`
  String get hygiene {
    return Intl.message(
      'Hygiene',
      name: 'hygiene',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get goodmorning {
    return Intl.message(
      'Good Morning',
      name: 'goodmorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get goodafternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'goodafternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get goodevening {
    return Intl.message(
      'Good Evening',
      name: 'goodevening',
      desc: '',
      args: [],
    );
  }

  /// `Good Night`
  String get goodnight {
    return Intl.message(
      'Good Night',
      name: 'goodnight',
      desc: '',
      args: [],
    );
  }

  /// `ShowRoom`
  String get showroom {
    return Intl.message(
      'ShowRoom',
      name: 'showroom',
      desc: '',
      args: [],
    );
  }

  /// `Head Office`
  String get headoffice {
    return Intl.message(
      'Head Office',
      name: 'headoffice',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose Your Current Work Location`
  String get location {
    return Intl.message(
      'Please Choose Your Current Work Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Share your experience with KOFI Canteen`
  String get shareYourExperienceWithCoffeeRestaurant {
    return Intl.message(
      'Share your experience with KOFI Canteen',
      name: 'shareYourExperienceWithCoffeeRestaurant',
      desc: '',
      args: [],
    );
  }

  /// `Thanks you for your feedback.`
  String get thankYouForYourFeedback {
    return Intl.message(
      'Thanks you for your feedback.',
      name: 'thankYouForYourFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Choose your feedbacks below that you think that`
  String get chooseFeedbacksBelowThatYouThinkIs {
    return Intl.message(
      'Choose your feedbacks below that you think that',
      name: 'chooseFeedbacksBelowThatYouThinkIs',
      desc: '',
      args: [],
    );
  }

  /// `KOFI is employer of choice ; We are committed to providing you with good experiences`
  String get qoute {
    return Intl.message(
      'KOFI is employer of choice ; We are committed to providing you with good experiences',
      name: 'qoute',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'km'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L> load(Locale locale) => L.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

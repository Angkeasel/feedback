import 'package:flutter/material.dart';

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'quantity': 'Quantity',
      'quality': 'Quality',
      'service': 'Service',
      'hygiene': 'Hygiene',
    },
    'km': {
      'quantity': 'បរិមាណ',
      'quality': 'គុណភាព',
      'service': 'សេវាកម្ម',
      'hygiene': 'អនាម័យ',
    },
  };

  static List<String> languages() => _localizedValues.keys.toList();

  String get quantity {
    return _localizedValues[locale.languageCode]!['quantity']!;
  }

  ///
  String get quality {
    return _localizedValues[locale.languageCode]!['quality']!;
  }

  ///
  String get service {
    return _localizedValues[locale.languageCode]!['service']!;
  }

  //
  String get hygiene {
    return _localizedValues[locale.languageCode]!['hygiene']!;
  }
}

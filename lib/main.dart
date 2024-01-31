import 'package:codelitt_calendar/src/core/core.dart';
import 'package:codelitt_calendar/src/core/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();

  Locator.setup();

  runApp(const App());
}

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

abstract class AppLogger {
  void d(dynamic message);
  void t(dynamic message);
  void i(dynamic message);
  void w(dynamic message);
  void e(dynamic message);
  void f(dynamic message);
}

class AppLoggerImpl extends AppLogger {
  late Logger _logger;

  // Private constructor
  AppLoggerImpl._internal() {
    _logger = Logger(printer: PrettyPrinter(methodCount: 0));
    debugPrint('AppLoggerImpl Creation');
  }

  // Static instance
  static AppLoggerImpl? _instance;

  // Factory constructor to access the instance
  factory AppLoggerImpl() {
    _instance ??= AppLoggerImpl._internal();
    return _instance!;
  }

  @override
  void d(message) => _logger.d(message);

  @override
  void e(message) => _logger.e(message);

  @override
  void f(message) => _logger.f(message);

  @override
  void i(message) => _logger.i(message);

  @override
  void t(message) => _logger.t(message);

  @override
  void w(message) => _logger.w(message);
}
